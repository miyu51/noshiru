class ReferencesController < ApplicationController
  def index
    @references = Reference.order(:author_furigana)
  end
end
