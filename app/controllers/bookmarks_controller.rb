class BookmarksController < ApplicationController
  def create
    @noshi = Noshi.find(params[:noshi_id])
    current_user.bookmark(@noshi)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "bookmark-button-for-noshi-#{@noshi.id}",
          partial: "noshis/unbookmark",
          locals: { noshi: @noshi }
        )
      end
    end
  end

  def destroy
    @noshi = current_user.bookmarks.find(params[:id]).noshi
    current_user.unbookmark(@noshi)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "bookmark-button-for-noshi-#{@noshi.id}",
          partial: "noshis/bookmark",
          locals: { noshi: @noshi }
        )
      end
    end
  end
end
