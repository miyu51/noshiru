class NoshiBookmarksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show, :destroy]

  def require_login
    flash[:alert] = 'ブックマーク機能はログイン後にご利用いただけます。'
    redirect_to new_user_session_path
  end

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
