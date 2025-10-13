class NoshisController < ApplicationController
  def index
    # joinで検索対象に含める
    @q = Noshi.joins(:categories, :synonyms).ransack(params[:q])
    # includesで検索結果にも反映
    @noshis = @q.result(distinct: true).includes(:categories, :synonyms)
    @use_cases = Category.where.not(use_case: [nil, '']).select(:use_case).distinct.order(:use_case)
    #キーワード検索判定
    keyword = :label_or_description_or_synonyms_word_or_categories_use_case_or_categories_religion_or_columns_title_or_columns_text_cont
    @keyword_search = params[:q].present? && params[:q][keyword].present?
  end

  def show
    @q = Noshi.joins(:categories, :synonyms).ransack(params[:q])
    @noshis = @q.result(distinct: true).includes(:category, :synonyms)
    @use_cases = Category.select(:use_case).distinct.order(:use_case)
    @religions = Category.select(:religion).distinct.order(:religion)
    @noshi = Noshi.find(params[:id])
    # @noshi.tag_idsは現在表示中の熨斗が持つタグのID一覧
    # where(tags: { id: @noshi.tag_ids })で同じタグを持つ熨斗抽出
    # where.not(id: @noshi.id)で自分を除外
    @related_noshis = Noshi.joins(:tags).where(tags: { id: @noshi.tag_ids }).where.not(id: @noshi.id).group('noshis.id').order('COUNT(tags.id) DESC')
    @related_columns = Column.joins(:tags).where(tags: { id: @noshi.tag_ids }).distinct
  end

  def bookmarks
    @q = current_user.bookmark_noshis.ransack(params[:q])
    @bookmark_noshis = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end
end