module C2DM
	# This method is for running stored procedures.
	#
	# @return [Hash]
	#
	def self.sendMsg(reg_id, message = "BridgingGood", extra_data = "", collapse_key="some-collapse-key")
		options = {
			:registration_id =>reg_id,
			:message => message,
			:extra_data => extra_data,
			:collapse_key => collapse_key
		}

		return response = SpeedyC2DM::API.send_notification(options)
	end
end
