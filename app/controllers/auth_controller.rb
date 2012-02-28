class AuthController < ApplicationController
  def LoginByFacebookFromMobile
		if(params[:UserEmail].nil? or params[:UserFirstName].nil? or params[:UserLastName].nil? or params[:DeviceId].nil? or params[:DeviceType].nil?)
			@result = {:resultCode => 'E100', :resultMsg => 'Invalid parameters'} 
		else
			query = "call LoginByFacebookFromMobile('"+params[:UserEmail]+"','"+
					params[:UserFirstName]+"','"+ params[:UserLastName]+"','"+
					params[:DeviceId]+"','" + params[:DeviceType] + "')"
			@result = MySQL_SP.call(query)
		end
	
		#If SP returned a result,
		if !@result.nil?
			respond_to do |format|
				format.json { render:json => @result.first.to_json}
			end
		end
  end

  def LoginByTokenFromMobile
		if(params[:TokenString].nil? or params[:DeviceId].nil?)
			@result = {:resultCode => 'E100', :resultMsg => 'Invalid parameters'} 
		else
			query = "call LoginByTokenFromMobile('"+params[:TokenString]+"','"+params[:DeviceId]+"')"
			@result = MySQL_SP.call(query)
		end
	
		#If SP returned a result,
		if !@result.nil?
			respond_to do |format|
				format.json { render:json => @result.first.to_json}
			end
		end
  end

  def LoginByUserFromMobile
		if(params[:UserEmail].nil? or params[:UserPassword].nil? or params[:DeviceId].nil? or params[:DeviceType].nil?)
			@result = {:resultCode => 'E100', :resultMsg => 'Invalid parameters'} 
		else
			query = "call LoginByUserFromMobile('"+params[:UserEmail]+"', '"+
						params[:UserPassword]+"', '"+params[:DeviceId]+"','"+params[:DeviceType]+"')"
			@result = MySQL_SP.call(query)
		end
	
		#If SP returned a result,
		if !@result.nil?
			respond_to do |format|
				format.json { render:json => @result.first.to_json}
			end
		else
		end
  end

	def CreatePushNotificationAndroid
		if(params[:UserEmail].nil? or params[:C2DMRegId].nil? or params[:DeviceId].nil?)
			@result = {:resultCode => 'E100', :resultMsg => 'Invalid parameters'} 
		else
			query = "call CreatePushNotificationAndroid('"+params[:UserEmail]+"', '"+ params[:C2DMRegId]+"','"+params[:DeviceId]+"')"
			@result = MySQL_SP.call(query)
		end
		
		if !@result.nil?
			respond_to do |format|
				format.json { render:json => @result.first.to_json}
			end
		else
		end
	end

	def CreateQRCode
		#if parameters are empty, return error code
		if(params[:UserId].nil? or params[:DeviceId].nil?)
			resultCode = 'E100'
			resultMsg = 'Invalid parameters'
		else
			resultCode = QRCode.generateQRCode(params[:UserId], params[:DeviceId])
			resultMsg = 'QRCode.generateQRCode called'
		end

		@result = {:resultCode => resultCode, :resultMsg => resultMsg}

		if !@result.nil?
			respond_to do |format|
				format.json { render:json =>@result.to_json }
			end
		end
	end

end
