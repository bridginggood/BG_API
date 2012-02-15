class AuthController < ApplicationController
  def LoginByFacebookFromMobile
		#query = "call LoginByFacebookFromMobile('"+params[:UserEmail]+"','"+
		#			params[:UserFirstName]+"','"+ params[:UserLastName]+"', @code, @msg)"
		query = "call LoginByFacebookFromMobile('"+params[:UserEmail]+"','"+
					params[:UserFirstName]+"','"+ params[:UserLastName]+"')"
		@result = MySQL_SP.call(query)
	
		#If SP returned a result,
		if !@result.nil?
			respond_to do |format|
				format.json { render:json => @result.first.to_json}
			end
		end
  end

  def LoginByTokenFromMobile
		#query = "call LoginByTokenFromMobile('"+params[:TokenString]+"', @code, @msg)"
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
		#query = "call LoginByUserFromMobile('"+params[:UserEmail]+"', '"+
		#				params[:UserPassword]+"', @code, @msg)"
		query = "call LoginByUserFromMobile('"+params[:UserEmail]+"', '"+
						params[:UserPassword]+"')"
		@result = MySQL_SP.call(query)
		@resultCode = MySQL_SP.call ("select @code, @msg")
	
		#If SP returned a result,
		if !@result.nil?
			respond_to do |format|
				format.json { render:json => @result.first.to_json}
			end
		else
		end
  end
end
