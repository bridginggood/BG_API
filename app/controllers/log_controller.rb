class LogController < ApplicationController
	def CreateSNSLog
		if(params[:UserId].nil? || params[:BusinessId].nil? || params[:Facebook].nil? || (params[:Facebook][0] != 'Y' && params[:Facebook][0] != 'N'))
			resultCode = 'E100'
			resultMsg = 'Invalid parameters'
			@result = {:resultCode => resultCode, :resultMsg => resultMsg}
		else
			query = "call CreateSNSLog("+params[:UserId]+","+params[:BusinessId]+",'"+params[:Facebook]+"')"
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
