class Reservation < ActiveRecord::Base
  belongs_to :listing
  after_validation :create_mission

  private

  def create_mission
    # Checkin checkout
    @last_checks = listing.missions.all.select { |mission| mission.name = 'Last check-out' }
    condition = 0
    @last_checks.each { |check| condition += 1 if check.date == end_date}
    if condition.zero?
      @mission = Mission.new
      @mission.listing = listing
      @mission.name = 'Checkout-checkin'
      @mission.date = end_date
      @mission.price = Mission::TYPES[@mission.name] * listing.num_rooms
      @mission.save
    end
  end
end
