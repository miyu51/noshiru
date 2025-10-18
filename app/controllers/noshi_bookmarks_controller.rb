class NoshiBookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @noshi = Noshi.find(params[:noshi_id])
    current_user.noshi_bookmark(@noshi)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "bookmark-button-for-noshi-#{@noshi.id}",
          partial: "bookmarks/noshi_unbookmark",
          locals: { noshi: @noshi }
        )
      end
    end
  end

  def show
    @noshis = current_user.bookmark_noshis.includes(:image_attachment)
  end

  def destroy
    @bookmark = current_user.noshi_bookmarks.find(params[:id])
    @noshi = @bookmark.noshi
    @bookmark.destroy
    respond_to do |format|
      format.turbo_stream do
      render turbo_stream: turbo_stream.replace(
        "bookmark-button-for-noshi-#{@noshi.id}",
        partial: "bookmarks/noshi_bookmark",
        locals: { noshi: @noshi }
      )
      end
    end
  end
end
