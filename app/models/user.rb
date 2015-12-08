class User < ActiveRecord::Base
	has_many :biliks
  has_many :comments
  has_many :bookings

end
