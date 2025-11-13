class NoshiBookmarksController < ApplicationController
  before_action :require_login

  def create
    @noshi = Noshi.find(params[:noshi_id])
    current_user.noshi_bookmark(@noshi)
    respond_to do |format|
      format.turbo_stream
    end
  end

  def show
    @noshis = current_user.bookmark_noshis
  end

  def destroy
    @noshi = Noshi.find(params[:noshi_id])
    current_user.noshi_unbookmark(@noshi)
    respond_to do |format|
      format.turbo_stream
    end 
  end
end
