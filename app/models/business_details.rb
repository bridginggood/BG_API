class BusinessDetails < ActiveRecord::Base
	set_table_name 'business_details'
	reverse_geocoded_by :Latitude, :Longitude
	after_validation :reverse_geocode
	geocoded_by :BusinessAddress

	validates(:BusinessId, 			:presence => true)
	validates(:BusinessName, 		:presence => true, :length => { :maximum => 25 })
	validates(:BusinessAddress, :presence => true, :length => { :maximum => 100 })
	validates(:BusinessPhone, 	:presence => true, :length => { :maximum => 25 })
	validates(:Latitude, 				:presence => true)
	validates(:Longitude, 			:presence => true)
	validates(:BusinessCategory,:presence => true, :length => { :maximum =>5 })
	validates(:CreatedAt, 			:presence => true)
	validates(:UpdatedAt, 			:presence => true)
end
