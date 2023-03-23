class Listing < ActiveRecord::Base
  has_many :bookings, dependent: :destroy
  has_many :missions, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
