class Mission < ActiveRecord::Base
  belongs_to :listing

  TYPES = { 'First check-in' => 10, 'Last check-out' => 10, 'Checkout-checkin' => 5 }.freeze

  validates :name, inclusion: { in: TYPES.keys}
end
