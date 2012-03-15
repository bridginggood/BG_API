class BusinessInfoController < ApplicationController
	def index
		@bizInfo = BusinessInfo.find(:all)
		respond_to do |format|
			format.json { render:json=>@bizInfo.to_json}
		end
	end

  def create
  end

  def readList
		#NOTE: dist must be in miles
		dist = 50
		biz_per_page = 5

		# Search within (dist) miles. 
		@bizInfo = BusinessInfo.near([params[:lat], params[:lng]], dist).select("business_info.*, support.CharityId").joins("INNER JOIN support ON support.businessid = business_info.businessid")

		#Paginate. Show (biz_per_page) items per page.
		@bizInfoPaginate = @bizInfo.paginate(:page => params[:page] , :per_page => biz_per_page)
		respond_to do |format|
			format.json {render:json=>@bizInfoPaginate.to_json}
		end
  end

  def readMap
		#NOTE: dist must be in miles
		# Search within (dist) miles. 
		@bizInfo = BusinessInfo.near([params[:lat], params[:lng]], params[:dist]).select("business_info.*, support.CharityId").joins("INNER JOIN support ON support.businessid = business_info.businessid")

		respond_to do |format|
			format.json {render:json=>@bizInfo.to_json}
		end
  end

end
