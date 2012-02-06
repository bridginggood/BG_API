class BusinessInfoController < ApplicationController
	def index
		@bizInfo = BusinessInfo.find(:all)
		respond_to do |format|
			format.html	#idnex.rhtml
			format.xml {render :xml =>@bizInfo.to_xml }
		end
	end

  def create
  end

  def read
		#@bizInfo = BusinessInfo.near([37.4848, 126.895], params[:dist])
		#Example: http://api.bridginggood.com/business_info/read.xml?lat=37.4848&lng=126.895&dist=0.1
		#NOTE: dist must be in miles
		@bizInfo = BusinessInfo.near([params[:lat], params[:lng]], params[:dist])
		respond_to do |format|
			format.html
			format.xml { render :xml => @bizInfo.to_xml }
		end
  end

  def update
  end

  def delete
  end

end
