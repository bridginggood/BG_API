class CharityDetailsController < ApplicationController

	def GetCharityLatest
		query = "call GetCharityLatest()"
		@result = MySQL_SP.call(query)

		if !@result.nil?
			respond_to do |format|
				format.json { render:json =>@result.to_json }
			end
		end
	end
end
