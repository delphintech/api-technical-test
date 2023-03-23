class Listing < ActiveRecord::Base
  has_many :bookings
  has_many :missions
  has_many :reservations
end
