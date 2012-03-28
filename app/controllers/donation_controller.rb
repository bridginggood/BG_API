class DonationController < ApplicationController
	# @PARAM UserId, BusinessId, DeviceId
  def MakeDonation
		if(params[:QrId].nil? or params[:BusinessId].nil?)
			@result = {:resultCode => 'E100', :resultMsg => 'Invalid parameters'} 
		else
			query = "call CreateDonation("+params[:BusinessId]+",'"+params[:QrId]+"')"
			@result = MySQL_SP.call(query)

			# if result is not empty and the call to CreateDonation was successful,
			if !@result.nil? and @result.first['resultCode'][0] == 'S'
				@result = SendPushNotification(@result.first['UserId'], params[:BusinessId], @result.first['DonationAmount'])
			else
				@result = {:resultCode => 'E101', :resultMsg => 'Call to CreateDon..SP was not successful'} 
			end
		end

		#Output result,
		if !@result.nil?
			respond_to do |format|
				format.json { render:json => @result.to_json}
			end
		end
  end

	def SendPushNotification(userId, businessId, donationAmount)
		#Return sucess result if userId is null
		if userId.nil? 
			@result = [{:resultCode => 'S100', :resultMsg=>'Success but no user found to send notification. This is unregistered donation'}]
			return @result
		end

		query = "call FindDeviceToSendPushNotification("+userId.to_s+")"
		@result = MySQL_SP.call(query)
		count = 0
		# if result is not empty and the call to FindDeviceToSendPushNotification was successful,
		if !@result.nil? and !@result.first.nil? and @result.first['resultCode'][0] == 'S'

			#TODO update the message content
			message = 'DonationSuccess,'+businessId.to_s+','+donationAmount.to_s
			
			log = File.open("/var/log/bridginggood/push_notification.log", "a+")
			#Loop each @result and send push notification
			@result.each do |row|
				if row['DeviceType'] == 'ANDRO'
					c2dmResult = C2DM.sendMsg(row['Token'], message, "", "1")
					if c2dmResult.code == "200" #HTTP response 200
						log.puts ("Sent: "+Time.now.to_s+" | Type: C2DM | Token: "+row['Token']+" | Mesage: "+message+ " | Result: "+c2dmResult.body)		
					end
				elsif row['DeviceType'] == 'IOS'
						log.puts ("Sent: "+Time.now.to_s+" | Type: IOS  | Token: "+row['Token']+" | Mesage: "+message)		
					APNS.sendMsg(row['Token'], 'New donation made!', message)	
				end

				count = count+1
			end
			log.close
		else
			@result = {:resultCode => 'S100', :resultMsg => 'Donation has been made. However, no device to send push notification'}
		end

		return @result
	end

end
