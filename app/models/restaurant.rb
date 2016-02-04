class Restaurant < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :reviews
  has_many :reservations
  has_many :users, through: :reservations

  def available?(party_size, time)
    all_reservations = reservations.where("time >= ? and time < ?", time.beginning_of_hour, time.end_of_hour).sum(:party_size)
    available_capacity = capacity - all_reservations

    party_size > 0 && party_size <= available_capacity
  end
end
