class Review < ApplicationRecord
  belongs_to :restaurant
  # creates a method .restaurant to read the restaurant
  # create a method .restaurant = some_restaurant to assign a restaurant

  validates :content, presence: true
end
