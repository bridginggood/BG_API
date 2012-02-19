require 'net/http'
require 'net/https'

class PushController < ApplicationController
	include C2DM

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
  end
end
