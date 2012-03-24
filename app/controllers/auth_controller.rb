class AuthController < ApplicationController
  def LoginByFacebookFromMobile
		if(params[:FacebookUid].nil? or params[:Email].nil? or params[:FirstName].nil? or params[:LastName].nil? or params[:DeviceId].nil? or params[:DeviceType].nil?)
			@result = {:resultCode => 'E100', :resultMsg => 'Invalid parameters'} 
		else
			query = "call LoginByFacebook("+params[:FacebookUid]+",'"+
					params[:Email]+"','"+ params[:FirstName]+"','"+params[:LastName]+"','"+
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
			query = "call LoginByToken('"+params[:TokenString]+"','"+params[:DeviceId]+"')"
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
			query = "call LoginByUser('"+params[:UserEmail]+"', '"+
						params[:UserPassword]+"', '"+params[:DeviceId]+"','"+params[:DeviceType]+"')"
			@result = MySQL_SP.call(query)
		end
	
		#If SP returned a result,
		if !@result.nil?
			respond_to do |format|
				format.json { render:json => @result.first.to_json}
			end
		end
  end

	def Logout
		if(params[:UserId].nil? or params[:DeviceId].nil? or params[:DeviceType].nil?)
			@result = {:resultCode => 'E100', :resultMsg => 'Invalid parameters'} 
		else
			query = "call Logout("+params[:UserId]+",'"+params[:DeviceId]+"','"+params[:DeviceType]+"')"
			@result = MySQL_SP.call(query)
		end

		if !@result.nil?
			respond_to do |format|
				format.json { render:json => @result.first.to_json}
			end
		end
	end

	def CreateC2DMDevice
		if(params[:C2DMRegId].nil? or params[:DeviceId].nil?)
			@result = {:resultCode => 'E100', :resultMsg => 'Invalid parameters'} 
		else
			query = "call CreateC2DMDevice('"+ params[:C2DMRegId]+"','"+params[:DeviceId]+"')"
			@result = MySQL_SP.call(query)
			if !@result.nil?
				@result = @result.first
			end
		end
		
		if !@result.nil?
			respond_to do |format|
				format.json { render:json => @result.to_json}
			end
		end
	end

	def CreateQrcodeFromMobile
		#if parameters are empty, return error code
		if(params[:UserId].nil?)
			resultCode = 'E100'
			resultMsg = 'Invalid parameters'
			@result = {:resultCode => resultCode, :resultMsg => resultMsg}
		else
			param = "'"+params[:UserId]+"'"
			@result = QRCode.generateQRCode(param)
		end

		if !@result.nil?
			respond_to do |format|
				format.json { render:json =>@result.to_json }
			end
		end
	end

	def RegisterQrcodeFromMobile
		if(params[:UserId].nil? || params[:QrId].nil?)
			resultCode = 'E100'
			resultMsg = 'Invalid parameters'
			@result = {:resultCode => resultCode, :resultMsg => resultMsg}
		else
			query = "call RegisterQrcode("+params[:UserId]+",'"+params[:QrId]+"')"
			@result = MySQL_SP.call(query)
			if !@result.nil?
				@result = @result.first
			end
		end	

		if !@result.nil?
			respond_to do |format|
				format.json { render:json =>@result.to_json }
			end
		end
	end

	def LoginByBusinessFromMobile
		if(params[:Username].nil? || params[:Password].nil?)
			resultCode = 'E100'
			resultMsg = 'Invalid parameters'
			@result = {:resultCode => resultCode, :resultMsg => resultMsg}
		else
			query = "call LoginByBusiness('"+params[:Username]+"','"+params[:Password]+"')"
			@result = MySQL_SP.call(query)
			if !@result.nil?
				@result = @result.first
			end
		end	

		if !@result.nil?
			respond_to do |format|
				format.json { render:json =>@result.to_json }
			end
		end
	end
end
