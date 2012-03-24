require 'speedy_c2dm'
require "net/http"
require "net/https"

C2DM_API_EMAIL = "admin@bridginggood.com"
C2DM_API_PASSWORD = 'teamgood'

SpeedyC2DM::API.set_account(C2DM_API_EMAIL, C2DM_API_PASSWORD)

