class Admin::ColumnsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_column, only: [:show, :edit, :update, :destroy]

  def index
    @q = Column.joins(:tags).ransack(params[:q])
    # includesで検索結果にも反映
    @columns = @q.result(distinct: true).includes(:tags).order(created_at: :desc)
  end

  def new
    @column = Column.new
  end

  def create
    @column = Column.new(column_params)

    if @column.save
      if params[:tag_names].present?
        tags = Tag.where(name: params[:tag_names])
        @column.tags << tags
      end
      respond_to do |f|
        f.turbo_stream { render turbo_stream: turbo_stream.replace('main', partial: 'admin/columns/show', locals: { column: @column }) }
        f.html { redirect_to admin_columns_path, notice: 'コラムを投稿しました。' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @q = Column.joins(:tags).ransack(params[:q])
    @columns = @q.result(distinct: true).includes(:tags)
    @column = Column.find(params[:id])
    @related_columns = Column.joins(:tags).where(tags: { id: @column.tag_ids }).where.not(id: @column.id).group('columns.id').order('COUNT(tags.id) DESC')
    @related_noshis = Noshi.joins(:tags).where(tags: { id: @column.tag_ids }).distinct
  end

  def edit; end

  def update
    if @column.update(column_params)
      redirect_to admin_columns_path, notice: 'コラムを更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @column.destroy
    redirect_to admin_columns_path, notice: 'コラムを削除しました。'
  end

  private

  def column_params
    params.require(:column).permit(:title, :text, :thumbnail)
  end

  def set_column
    @column = Column.find(params[:id])
  end
end
