require 'net/http'
require 'net/https'
#require 'apn_on_rails'

class PushController < ApplicationController
	include C2DM
  include APNS

  def android
		reg = params[:RegId]
		msg = params[:Message]
	
		#options = {
			#:registration_id => reg,
			#:message => msg, 
		#}
		#response = SpeedyC2DM::API.send_notification(options)
		C2DM.sendMsg(reg, msg)
  end

  def ios
    #device = APN::Device.create(:token => "a8d94e28 9c71e1be e999e8cd ed1b2116 24553a90 03b81981 67229eef 8a1babcd")   
    #device = Device.create(:token => "a8d94e28 9c71e1be e999e8cd ed1b2116 24553a90 03b81981 67229eef 8a1babcd")   
    #notification = APN::Notification.new   
    #notification = Notification.new   
    #notification.device = device   
    #notification.badge = 5   
    #notification.sound = true   
    #notification.alert = "My first push"   
    #notification.save   
		APNS.sendMsg()
  end
end
