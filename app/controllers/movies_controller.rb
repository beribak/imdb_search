class MoviesController < ApplicationController
  def index
    if params[:query].present?
      # JOINT TABLE WITH WHERE AND ILIKE
      # @movies = Movie.joins(:director).where("movies.title ILIKE :query OR synopsis ILIKE :query OR directors.first_name ILIKE :query OR directors.last_name ILIKE :query", query: "%#{params[:query]}%")
      
      # JOINT TABLE WITH WHERE AND @@
      # @movies = Movie.joins(:director).where("movies.title @@ :query OR synopsis @@ :query OR directors.first_name @@ :query OR directors.last_name @@ :query", query: "%#{params[:query]}%")
    
      # SEARCH WITH WHERE MULTIPLE COLUMNS
      # @movies = Movie.where("title ILIKE :query OR synopsis ILIKE :query", query: "%#{params[:query]}%")

      # SEARCH WITH WHERE ONE COLUMN
      # @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")
      
      # SCOPE PGsearch gem
      # @movies = Movie.search_movies(params[:query])

      # MULTISEARCH PGsearch gem
      PgSearch::Multisearch.rebuild(Movie)
      PgSearch::Multisearch.rebuild(TvShow)
      @movies_and_shows = PgSearch.multisearch(params[:query])

    else
      @movies = Movie.all
    
    end
  end
end
