class Review < ActiveRecord::Base
  validates :comment, presence: true
  belongs_to :user
  belongs_to :restaurant
end
