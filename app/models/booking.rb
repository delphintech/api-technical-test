class Booking < ActiveRecord::Base
  belongs_to :listing
  after_validation :create_missions

  private

  def create_missions
    # First Check-in
    @mission = Mission.new
    @mission.listing = listing
    @mission.name = 'First check-in'
    @mission.date = start_date
    @mission.price = Mission::TYPES[@mission.name] * listing.num_rooms
    @mission.save

    # Last Check-out
    @mission = Mission.new
    @mission.listing = listing
    @mission.name = 'Last check-out'
    @mission.date = end_date
    @mission.price = Mission::TYPES[@mission.name] * listing.num_rooms
    @mission.save
  end
end
