class TopsController < ApplicationController
  def top
    # スライドショー
    @latest_columns = Column.order(created_at: :desc).limit(3)
    @use_cases = Category.where.not(use_case: [nil, '']).select(:use_case).distinct.order(:use_case)

    # 検索パラメータを分離
    if params[:q].present?
      # 🔍 1. 複合キーをそのまま使う
      full_key = "label_or_description_or_synonyms_word_or_categories_use_case_or_categories_religion_or_columns_title_or_columns_text_cont"

      # 🔍 2. Noshi用とColumn用に分ける
      noshi_key = "label_or_description_or_synonyms_word_or_categories_use_case_or_categories_religion_cont"
      column_key = "columns_title_or_columns_text_cont"

      keyword = params[:q][full_key]

      # 🔍 3. 分割してそれぞれに渡す
      noshi_params = keyword.present? ? { noshi_key => keyword } : {}
      column_params = keyword.present? ? { column_key => keyword } : {}
      
      # Ransackオブジェクト生成
      @q = Noshi.joins(:categories, :synonyms).ransack(noshi_params)
      @column_q = Column.ransack(column_params)

      # 検索結果取得
      @noshis = @q.result(distinct: true).includes(:categories, :synonyms)
      @columns = @column_q.result(distinct: true).includes(:tags)

      # キーワード検索判定（どちらかに値があれば true）
      @keyword_search = noshi_params.values.any?(&:present?) || column_params.values.any?(&:present?)

    else
      @q = Noshi.joins(:categories, :synonyms).ransack({})
      @column_q = Column.ransack({})
      @noshis = []
      @columns = []
      @keyword_search = false
    end
  end
end
