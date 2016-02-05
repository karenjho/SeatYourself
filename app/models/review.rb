class Review < ActiveRecord::Base
  validates :comment, :rating, presence: true
  belongs_to :user
  belongs_to :restaurant
end
