class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :date_time, :party_size, presence: true
end
