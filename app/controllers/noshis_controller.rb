class NoshisController < ApplicationController
  def index
    # joinで検索対象に含める
    @q = Noshi.joins(:category, :synonyms).ransack(params[:q])
    # includesで検索結果にも反映
    @noshis = @q.result(distinct: true).includes(:category, :synonyms)
    @use_cases = Category.select(:use_case).distinct.order(:use_case)
    @religions = Category.select(:religion).distinct.order(:religion)
  end

  def show
    @noshi = Noshi.find(params[:id])
    # @noshi.tag_idsは現在表示中の熨斗が持つタグのID一覧
    # where(tags: { id: @noshi.tag_ids })で同じタグを持つ熨斗抽出
    # where.not(id: @noshi.id)で自分を除外
    @related_noshis = Noshi.joins(:tags).where(tags: { id: @noshi.tag_ids }).where.not(id: @noshi.id).group('noshis.id').order('COUNT(tags.id) DESC')
  end
end