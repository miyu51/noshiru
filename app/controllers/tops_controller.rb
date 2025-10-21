class TopsController < ApplicationController
  def top
    @latest_columns = Column.order(created_at: :desc).limit(3)
    # joinで検索対象に含める
    @q = Noshi.joins(:categories, :synonyms).ransack(params[:q])
    @column_q = Column.ransack(params[:q])
    if params[:q].present?
      # includesで検索結果にも反映
      @noshis = @q.result(distinct: true).includes(:categories, :synonyms)
      @use_cases = Category.where.not(use_case: [nil, '']).select(:use_case).distinct.order(:use_case)
      @columns = @column_q.result(distinct: true).includes(:tags)
      #キーワード検索判定
      keyword = :label_or_description_or_synonyms_word_or_categories_use_case_or_categories_religion_or_columns_title_or_columns_text_cont
      @keyword_search = params[:q].present? && params[:q][keyword].present?
    else
      @noshis = []
      @columns = []
      @keyword_search = false
      @use_cases = []
    end
  end
end
