class Movie < ApplicationRecord
  belongs_to :director

  include PgSearch::Model
  
  multisearchable against: [:title, :synopsis], associated_against: {directors: [:first_name, :last_name]}
 
  # pg_search_scope :search_movies,
  # against: [:title, :synopsis],
  # associated_against: {director: [:first_name, :last_name]},
  # using: {
  #   :tsearch => { :prefix => true }
  # }

end
