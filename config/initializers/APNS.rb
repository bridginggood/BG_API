require 'apn_on_rails'

module APNS 
	# This method is for running stored procedures.
	#
	# @return [Hash]
	#
	#
	#
	#
	def self.sendMsg(apnToken,msg)
    #device = APN::Device.create(:token => "a8d94e28 9c71e1be e999e8cd ed1b2116 24553a90 03b81981 67229eef 8a1babcd")   
    notification = APN::Notification.new   
    #notification.device = device   
    #notification.device = APN::Device.find(:first,:conditions=>{:token => 'a8d94e28 9c71e1be e999e8cd ed1b2116 24553a90 03b81981 67229eef 8a1babcd'})   
    notification.device = APN::Device.find(:first,:conditions=>{:token => apnToken})   
    notification.badge = 1   
    notification.sound = true   
    #notification.alert = "My first push"   
    notification.alert = msg   
    notification.save
    APN::Notification.send_notifications
	end
end
