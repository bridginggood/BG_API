# == Schema Information
#
# Table name: business_info
#
#  BusinessId       :integer(8)      not null, primary key
#  BusinessName     :string(25)      not null
#  BusinessAddress  :string(100)     not null
#  BusinessPhone    :string(25)      not null
#  Latitude         :float           not null
#  Longitude        :float           not null
#  BusinessCategory :string(5)       not null
#  CreatedAt        :timestamp       not null
#  CreatedBy        :string(10)
#  UpdatedAt        :timestamp       not null
#  UpdatedBy        :string(10)
#

class BusinessInfo < ActiveRecord::Base
	set_table_name 'business_info'
	reverse_geocoded_by :Latitude, :Longitude
	after_validation :reverse_geocode
	geocoded_by :BusinessAddress

	has_many :support
end
