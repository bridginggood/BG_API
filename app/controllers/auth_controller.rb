class AuthController < ApplicationController
  def LoginByFacebookFromMobile
		query = "call LoginByFacebookFromMobile('"+params[:UserEmail]+"','"+
					params[:UserFirstName]+"','"+ params[:UserLastName]+"','"+
					params[:DeviceId]+"','" + params[:DeviceType] + "')"
		@result = MySQL_SP.call(query)
	
		#If SP returned a result,
		if !@result.nil?
			respond_to do |format|
				format.json { render:json => @result.first.to_json}
			end
		end
  end

  def LoginByTokenFromMobile
		query = "call LoginByTokenFromMobile('"+params[:TokenString]+"')"
		@result = MySQL_SP.call(query)
	
		#If SP returned a result,
		if !@result.nil?
			respond_to do |format|
				format.json { render:json => @result.first.to_json}
			end
		end
  end

  def LoginByUserFromMobile
		query = "call LoginByUserFromMobile('"+params[:UserEmail]+"', '"+
						params[:UserPassword]+"', '"+params[:DeviceId]+"','"+params[:DeviceType]+"')"
		@result = MySQL_SP.call(query)
	
		#If SP returned a result,
		if !@result.nil?
			respond_to do |format|
				format.json { render:json => @result.first.to_json}
			end
		else
		end
  end

	def CreatePushNotificationAndroid
		query = "call CreatePushNotificationAndroid('"+params[:UserEmail]+"', '"+ params[:C2DMRegId]+"')"
		@result = MySQL_SP.call(query)
		
		if !@result.nil?
			respond_to do |format|
				format.json { render:json => @result.first.to_json}
			end
		else
		end
	end
end
