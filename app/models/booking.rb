class Booking < ActiveRecord::Base
	has_many :declines
	belongs_to :user
end
