class Restaurant < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :reviews
  has_many :reservations
  has_many :users, through: :reservations

  validates :name, :capacity, :address, presence: true

  def available?(party_size, date_time)
    all_reservations = reservations.where("date_time >= ? and date_time < ?", date_time.beginning_of_hour, date_time.end_of_hour).sum(:party_size)
    available_capacity = capacity - all_reservations

    party_size > 0 && party_size <= available_capacity
  end
end
