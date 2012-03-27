class BusinessDetailsController < ApplicationController

  def readList
		#NOTE: dist must be in miles
		dist = 50
		biz_per_page = 5

		# Search within (dist) miles. 
		@bizList = BusinessDetails.near([params[:lat], params[:lng]], dist).select("business_details.*, supports.CharityId").joins("INNER JOIN supports ON supports.BusinessId = business_details.BusinessId")

		#Paginate. Show (biz_per_page) items per page.
		@bizListPaginate = @bizList.paginate(:page => params[:page] , :per_page => biz_per_page)
		respond_to do |format|
			format.json {render:json=>@bizListPaginate.to_json}
		end
  end

  def readMap
		#NOTE: dist must be in miles
		# Search within (dist) miles. 
		@bizList = BusinessDetails.near([params[:lat], params[:lng]], params[:dist]).select("business_details.*, supports.CharityId").joins("INNER JOIN supports ON supports.BusinessId = business_details.BusinessId")

		respond_to do |format|
			format.json {render:json=>@bizList.to_json}
		end
  end

	def businessDetail
		if(params[:BusinessId].nil?)
			@result = {:resultCode => 'E100', :resultMsg => 'Invalid parameters'} 
		else
			query = "call GetBusinessDetail("+params[:BusinessId]+")"
			@result = MySQL_SP.call(query)
		end

		#If sp returend a result,
		if !@result.nil?
			@result = @result.first
			respond_to do |format|
				format.json { render:json =>@result.to_json}
			end
		end
	end

end
