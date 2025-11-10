class NoshiBookmarksController < ApplicationController
  before_action :require_login, only: [:create, :show, :destroy]

  def create
    @noshi = Noshi.find(params[:noshi_id])
    current_user.noshi_bookmark(@noshi)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "bookmark-button-for-noshi-#{@noshi.id}",
          partial: "noshi_bookmarks/noshi_bookmark_button",
          locals: { noshi: @noshi }
        )
      end
      format.html { redirect_to noshi_path(@noshi) } 
    end
  end

  def show
    @noshis = current_user.bookmark_noshis
  end

  def destroy
    @noshi = Noshi.find(params[:noshi_id])
    current_user.noshi_unbookmark(@noshi)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "bookmark-button-for-noshi-#{@noshi.id}",
          partial: "noshi_bookmarks/noshi_bookmark_button",
          locals: { noshi: @noshi }
        )
      end
      format.html { redirect_to noshi_path(@noshi) }
    end  
  end
end
