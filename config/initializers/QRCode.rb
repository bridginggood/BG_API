require 'rqrcode'
require 'rqrcode_png'
require 'digest/sha1'

#[JS] QRCode module generates qrcode
module QRCode
	# filename must include full path of the file. (including png)
	def self.generateQRCode(userId=nil, size=4, level=:m, width=256)
		default_path = "/s3/BG_S3/media/qrcode/"

		#Create QR content
		qr_id = DateTime.now.strftime('%y%H%m%M%S%d%2L')+rand(10..99).to_s 
		filename = qr_id + ".png"
		#content = 'http://www.bridginggood.com/?qr=' + qr_id + '&code=' + Digest::SHA1.hexdigest('sex is life')
		content = 'http://www.bridginggood.com/?qr=' + qr_id
		full_path = default_path + filename

	
		#Save QR as file
		if(FileTest.exists?(full_path))
			return 'E0001'
		else
			qr = RQRCode::QRCode.new(content, :size=>size, :level=>level)
			png = qr.to_img
			png.resize(width, width).save(full_path)
		end

		#Update DB
		query = ""
		if(userId==nil)	#QR Created by Admin
			query = "call CreateQrcodeOnly('"+qr_id+"')"
			@result = MySQL_SP.call(query)
			if @result.nil?
				return 'E0002'
			end		
			return 'S0001:'+full_path+" Content:"+content+ " CreatedAt: "+DateTime.now.strftime('%Y.%m.%d %H:%M:%S.%2L')

		else #QR Created by user
			query = "call CreateQrcodeAndRegister("+userId+",'"+qr_id+"')"
			@result = MySQL_SP.call(query)
			if !@result.nil?
				return @result.first
			else
				return 'E0003'
			end
		end
	end


	def self.runGenerator(num=10, min=60000, max=120000)
		for i in (1..num)
			sleep (rand(min..max)/1000.0)
			puts QRCode.generateQRCode(nil)
		end
	end
end

