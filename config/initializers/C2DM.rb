module C2DM
	# This method is for running stored procedures.
	#
	# @return [Hash]
	#
	# [JS] This is a backup callBase method. Uses ActiveRecord:Base.
	#	Not using this because it does not work with SPs with out parameters
	def self.sendMsg(reg_id, message = "BridgingGood", extra_data = "", collapse_key="some-collapse-key")
		options = {
			:registration_id =>reg_id,
			:message => message,
			:extra_data => extra_data,
			:collapse_key => collapse_key
		}

		response = SpeedyC2DM::API.send_notification(options)
	end
end
