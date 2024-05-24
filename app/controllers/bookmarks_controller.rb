class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new(bookmark_params)
    # Bookmark takes comment, movie_id and list_id
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie])
    @bookmark.list_id = @list.id
    @bookmark.movie_id = @movie.id
    # TODO: Collect user input through strong params
    @bookmark.save!
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, @movie)
  end
end
