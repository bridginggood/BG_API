class DonationController < ApplicationController
	# @PARAM UserId, BusinessId, DeviceId
  def MakeDonation
		if(params[:UserId].nil? or params[:BusinessId].nil? or params[:DeviceId].nil?)
			@result = {:resultCode => 'E100', :resultMsg => 'Invalid parameters'} 
		else
			query = "call CreateDonation("+params[:UserId]+","+params[:BusinessId]+")"
			@result = MySQL_SP.call(query)

			# if result is not empty and the call to CreateDonation was successful,
			if !@result.nil? and @result.first['resultCode'][0] == 'S'
				@result = SendPushNotification(params[:UserId], params[:DeviceId])
			else
				@result = {:resultCode => 'E101', :resultMsg => 'Call to CreateDon..SP was not successful'} 
			end
		end

		#Output result,
		if !@result.nil?
			respond_to do |format|
				format.json { render:json => @result.first.to_json}
			end
		end
  end

	def SendPushNotification(userId, deviceId)
		query = "call FindDeviceToSendPushNotification("+userId+",'"+deviceId+"')"
		@result = MySQL_SP.call(query)
		
		# if result is not empty and the call to FindDeviceToSendPushNotification was successful,
		if !@result.nil? and @result.first['resultCode'][0] == 'S'
			#TODO update the message content
			message = 'DonationSuccess,'+deviceId
			if @result.first['DeviceType'] == 'ANDRO'
				C2DM.sendMsg(@result.first['RegistrationId'], message)
			elsif @result.first['DeviceType'] == 'IOS'
				#TODO CJ
			end
		else
			@result = {:resultCode => 'E101', :resultMsg => 'Call to FindDevice..SP was not successful'} 
		end

		return @result
	end

end
