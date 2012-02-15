module MySQL_SP
	# This method is for running stored procedures.
	#
	# @return [Hash]
	#
	# [JS] This is a backup callBase method. Uses ActiveRecord:Base.
	#	Not using this because it does not work with SPs with out parameters
	def self.callBase(sql, name = nil)
  	connection = ActiveRecord::Base.connection
  	begin
    	connection.select_all(sql, name)
  	rescue NoMethodError
  	ensure
    	connection.reconnect! unless connection.active?
  	end
	end
	

	# [JS] use this to call MySQL SPs
	def self.call(sql, name = nil)
  	connection = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys) 
  	begin
    	connection.query(sql)
  	rescue NoMethodError
  	ensure
  		connection = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys) #Reconnect 
  	end
	end

end
