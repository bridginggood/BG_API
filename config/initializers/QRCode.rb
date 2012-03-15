require 'rqrcode'
require 'rqrcode_png'
require 'digest/sha1'

#[JS] QRCode module generates qrcode
module QRCode
	# filename must include full path of the file. (including png)
	def self.generateQRCode(size=4, level=:m, width=256)
		default_path = "/s3/BG_DEV_S3/media/qrcode/"

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
		query = "call CreateQrcodeOnly('"+qr_id+"')"
		@result = MySQL_SP.call(query)
		if @result.nil?
			return 'E0002'
		end	

		return 'S0001:'+full_path+" Content:"+content
	end


	def self.runGenerator(num=10)
		for i in (1..num)
			sleep (rand(1..800)/100.0)
			puts QRCode.generateQRCode()
		end
	end
end
