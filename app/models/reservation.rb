class Reservation < ActiveRecord::Base
	belongs_to :diners
	belongs_to :restaurants
	# :restaurants has_many :diners through :reservations
end
