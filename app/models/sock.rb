class Sock < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo
  has_many :bookings
  belongs_to :user
  has_many :reviews, through: :bookings
  validates :name, :price, :description, :photo, :address, presence: true

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
