class TopsController < ApplicationController
  def top
    # joinで検索対象に含める
    @q = Noshi.joins(:category, :synonyms).ransack(params[:q])
    # includesで検索結果にも反映
    @noshis = @q.result(distinct: true).includes(:category, :synonyms)
    @use_cases = Category.select(:use_case).distinct.order(:use_case)
    @religions = Category.select(:religion).distinct.order(:religion)
  end
end
