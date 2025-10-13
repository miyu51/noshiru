class TopsController < ApplicationController
  def top
    # joinで検索対象に含める
    @q = Noshi.joins(:categories, :synonyms).ransack(params[:q])
    # includesで検索結果にも反映
    @noshis = @q.result(distinct: true).includes(:categories, :synonyms)
    @use_cases = Category.select(:use_case).distinct.order(:use_case)
    @religions = Category.select(:religion).distinct.order(:religion)
    #キーワード検索判定
    keyword = :label_or_description_or_synonyms_word_or_categories_use_case_or_categories_religion_or_columns_title_or_columns_text_cont
    @keyword_search = params[:q].present? && params[:q][keyword].present?
  end
end
