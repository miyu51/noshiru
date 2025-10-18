class ColumnBookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @column = Column.find(params[:column_id])
    current_user.column_bookmark(@column)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "bookmark-button-for-column-#{@column.id}",
          partial: "bookmarks/column_unbookmark",
          locals: {column: @column }
        )
      end
    end
  end

  def show
    @columns = current_user.bookmark_columns.includes(:thumbnail_attachment)
  end

  def destroy
    @bookmark = current_user.column_bookmarks.find(params[:id])
    @column = @bookmark.column
    @bookmark.destroy
    respond_to do |format|
      format.turbo_stream do
      render turbo_stream: turbo_stream.replace(
        "bookmark-button-for-column-#{@column.id}",
        partial: "bookmarks/column_bookmark",
        locals: { column: @column }
      )
      end
    end
  end
end
