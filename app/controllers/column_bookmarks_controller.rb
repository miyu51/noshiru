class ColumnBookmarksController < ApplicationController
  before_action :require_login, only: [:create, :show, :destroy]

  def create
    @column = Column.find(params[:column_id])
    current_user.column_bookmark(@column)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "bookmark-button-for-column-#{@column.id}",
          partial: "column_bookmarks/column_bookmark_button",
          locals: {column: @column }
        )
      end
    end
  end

  def show
    @columns = current_user.bookmark_columns
  end

  def destroy
    @column = Column.find(params[:column_id])
    current_user.column_unbookmark(@column)
    respond_to do |format|
      format.turbo_stream do
      render turbo_stream: turbo_stream.replace(
        "bookmark-button-for-column-#{@column.id}",
        partial: "column_bookmarks/column_bookmark_button",
        locals: { column: @column }
      )
      end
    end
  end
end
