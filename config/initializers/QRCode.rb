require 'rqrcode'
require 'rqrcode_png'
require 'digest/sha1'

#[JS] QRCode module generates qrcode
module QRCode
	# filename must include full path of the file. (including png)
	def self.generateQRCode(userId, deviceId, size=10, level=:h, width=256)
		default_path = "/var/web_test/api/s3/media/qrcode/"

		filename = userId+'_'+deviceId+".png"
		content = userId + ',' + Digest::SHA1.hexdigest('www.bridginggood.com') + ',' + deviceId
		#content = userId + ',' + deviceId

		full_path = default_path + filename
		qr = RQRCode::QRCode.new(content, :size=>size, :level=>level)
		png = qr.to_img
		png.resize(width, width).save(full_path)
	end
end
