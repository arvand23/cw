class Booking < ActiveRecord::Base
	has_many :declines
	belongs_to :user

	#validations: at least two times selected. times must be in future.
	validates :time_request1, presence: true
	validate :time1_request_in_future?
	validate :time2_request_in_future?
	validate :time3_request_in_future?

	def time1_request_in_future?
    	unless Date.today < self.time_request1
    		errors.add('Time requested', 'needs to be in future')
    	end
  	end

	def time2_request_in_future?
    	unless Date.today < self.time_request1
    		errors.add('The second time requested', 'needs to be in future')
    	end
  	end

  		def time3_request_in_future?
    	unless Date.today < self.time_request1
    		errors.add('The third time requested', 'needs to be in future')
    	end
  	end

end
