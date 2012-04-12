class StatsController < ApplicationController
	
	def UserTotalDonation
		if(params[:UserId].nil?)
			resultCode = 'E100'
			resultMsg = 'Invalid parameters'
			@result = {:resultCode => resultCode, :resultMsg => resultMsg}
		else
			query = "call GetUserTotalDonation("+params[:UserId]+")"
			@result = MySQL_SP.call(query)
		end	

		if !@result.nil?
			respond_to do |format|
				format.json { render:json =>@result.to_json }
			end
		end

	end

	def UserDonationByCharity
		if(params[:UserId].nil?)
			resultCode = 'E100'
			resultMsg = 'Invalid parameters'
			@result = {:resultCode => resultCode, :resultMsg => resultMsg}
		else
			query = "call GetUserDonationByCharity("+params[:UserId]+")"
			@result = MySQL_SP.call(query)
		end	

		if !@result.nil?
			respond_to do |format|
				format.json { render:json =>@result.to_json }
			end
		end
	end
	
	def UserDonationByPlace
		if(params[:UserId].nil?)
			resultCode = 'E100'
			resultMsg = 'Invalid parameters'
			@result = {:resultCode => resultCode, :resultMsg => resultMsg}
		else
			query = "call GetUserDonationByPlace("+params[:UserId]+")"
			@result = MySQL_SP.call(query)
		end	

		if !@result.nil?
			respond_to do |format|
				format.json { render:json =>@result.to_json }
			end
		end
	end

	def BusinessTodayCount
		if(params[:BusinessId].nil?)
			resultCode = 'E100'
			resultMsg = 'Invalid parameters'
			@result = {:resultCode => resultCode, :resultMsg => resultMsg}
		else
			query = "call GetBusinessTodayCount("+params[:BusinessId]+")"
			@result = MySQL_SP.call(query)
		end	

		if !@result.nil?
			respond_to do |format|
				format.json { render:json =>@result.to_json }
			end
		end
	end

	def BusinessAccountDetail
		if(params[:BusinessId].nil?)
			resultCode = 'E100'
			resultMsg = 'Invalid parameters'
			@result = {:resultCode => resultCode, :resultMsg => resultMsg}
		else
			query = "call GetBusinessAccountDetail("+params[:BusinessId]+")"
			@result = MySQL_SP.call(query)
		end	

		if !@result.nil?
			respond_to do |format|
				format.json { render:json =>@result.to_json }
			end
		end
	end

	def BusinessStatsDaily
		if(params[:BusinessId].nil? || params[:ResultCount].nil?)
			resultCode = 'E100'
			resultMsg = 'Invalid parameters'
			@result = {:resultCode => resultCode, :resultMsg => resultMsg}
		else
			query = "call GetBusinessStatsDaily("+params[:BusinessId]+","+params[:ResultCount]+")"
			@result = MySQL_SP.call(query)
		end	

		if !@result.nil?
			respond_to do |format|
				format.json { render:json =>@result.to_json }
			end
		end
	end

	def BusinessStatsWeekly
		if(params[:BusinessId].nil? || params[:ResultCount].nil?)
			resultCode = 'E100'
			resultMsg = 'Invalid parameters'
			@result = {:resultCode => resultCode, :resultMsg => resultMsg}
		else
			query = "call GetBusinessStatsWeekly("+params[:BusinessId]+","+params[:ResultCount]+")"
			@result = MySQL_SP.call(query)
		end	

		if !@result.nil?
			respond_to do |format|
				format.json { render:json =>@result.to_json }
			end
		end
	end

	def BusinessStatsMonthly
		if(params[:BusinessId].nil? || params[:ResultCount].nil?)
			resultCode = 'E100'
			resultMsg = 'Invalid parameters'
			@result = {:resultCode => resultCode, :resultMsg => resultMsg}
		else
			query = "call GetBusinessStatsMonthly("+params[:BusinessId]+","+params[:ResultCount]+")"
			@result = MySQL_SP.call(query)
		end	

		if !@result.nil?
			respond_to do |format|
				format.json { render:json =>@result.to_json }
			end
		end
	end

	def CharityDonation
		if(params[:CharityId].nil?)
			resultCode = 'E100'
			resultMsg = 'Invalid parameters'
			@result = {:resultCode => resultCode, :resultMsg => resultMsg}
		else
			query = "call GetCharityDonation("+params[:CharityId]+")"
			@result = MySQL_SP.call(query)
		end	

		if !@result.nil?
			respond_to do |format|
				format.json { render:json =>@result.to_json }
			end
		end
	end

	def ThankyouDetail
		if(params[:BusinessId].nil?)
			resultCode = 'E100'
			resultMsg = 'Invalid parameters'
			@result = {:resultCode => resultCode, :resultMsg => resultMsg}
		else
			query = "call GetThankyouDetail("+params[:BusinessId]+")"
			@result = MySQL_SP.call(query)
		end	

		if !@result.nil?
			respond_to do |format|
				format.json { render:json =>@result.to_json }
			end
		end
	end
	def UnreadNotifications 
		if(params[:DeviceId].nil?)
			resultCode = 'E100'
			resultMsg = 'Invalid parameters'
			@result = {:resultCode => resultCode, :resultMsg => resultMsg}
		else
			query = "call GetUnreadNotifications('"+params[:DeviceId]+"')"
			@result = MySQL_SP.call(query)
		end

		if !@result.nil?
			respond_to do |format|
				format.json { render:json =>@result.to_json }
			end
		end
	end

end
