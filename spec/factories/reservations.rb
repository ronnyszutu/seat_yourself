# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    diner_id 1
    restaurant_id 1
    reservation_time "2013-09-21 23:12:35"
    end_time "2013-09-21 23:12:35"
    party_size 1
  end
end
