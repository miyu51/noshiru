class ColumnsController < ApplicationController
  def index
    @columns = Column.all
  end

  def show
    @q = Column.joins(:tags).ransack(params[:q])
    @columns = @q.result(distinct: true).includes(:tags)
    @column = Column.find(params[:id])
    @related_columns = Column.joins(:tags).where(tags: { id: @column.tag_ids }).where.not(id: @column.id).group('columns.id').order('COUNT(tags.id) DESC')
    @related_noshis = Noshi.joins(:tags).where(tags: { id: @column.tag_ids }).distinct
  end

  def bookmarks
    @q = current_user.bookmark_columns.ransack(params[:q])
    @bookmark_columns = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end
end
