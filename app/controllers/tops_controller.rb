class TopsController < ApplicationController
  def top
    # スライドショー
    @latest_columns = Column.order(created_at: :desc).limit(3)

    keyword = params[:q]&.dig(:keyword)
    @use_cases = Category.where.not(use_case: [nil, '']).select(:use_case).distinct.order(:use_case)

    if keyword.present?
      noshi_params = {
        label_or_description_or_categories_use_case_or_categories_religion_cont: keyword
      }

      @q = Noshi.left_outer_joins(:categories, :synonyms).ransack(noshi_params)
      @noshis = @q.result(distinct: true).includes(:categories, :synonyms)
      @keyword_search = true
    else
      @q = Noshi.left_outer_joins(:categories).ransack(params[:q] || {})
      @noshis = @q.result(distinct: true).includes(:categories)
      @keyword_search = false
    end
  end
end
