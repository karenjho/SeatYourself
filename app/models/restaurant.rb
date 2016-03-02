class Restaurant < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
  has_and_belongs_to_many :tags

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :name, :capacity, :address, presence: true

  def available?(party_size, date_time)
    all_reservations = reservations.where("date_time >= ? and date_time < ?", date_time.beginning_of_hour, date_time.end_of_hour).sum(:party_size)
    available_capacity = capacity - all_reservations

    party_size > 0 && party_size <= available_capacity
  end

  def rating(restaurant)
    if restaurant.reviews.any?
      restaurant.reviews.average(:rating).round(1)
    else
      0
    end
  end

end
