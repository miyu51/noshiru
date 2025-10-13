class ColumnsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Column.joins(:tags).ransack(params[:q])
    # includesで検索結果にも反映
    @Columns = @q.result(distinct: true).includes(:tags).order(created_at: :desc)

    #キーワード検索判定
    keyword = :synonyms_word_or_label_or_category_use_case_or_category_religion_or_description_columns_title_or_columns_text_cont
    @keyword_search = params[:q].present? && params[:q][keyword].present?
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
