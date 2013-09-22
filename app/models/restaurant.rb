class Restaurant < ActiveRecord::Base
	has_many :diners,through reserverations
	has_many :reserverations
	belongs_to :restaurant_owner
end	
