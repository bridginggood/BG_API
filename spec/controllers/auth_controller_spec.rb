require 'spec_helper'

describe AuthController do

  describe "POST 'LoginByFacebookFromMobile'" do
    it "returns http success" do
      post 'LoginByFacebookFromMobile'
      response.should be_success
    end
  end

  describe "POST 'LoginByTokenFromMobile'" do
    it "returns http success" do
      post 'LoginByTokenFromMobile'
      response.should be_success
    end
  end

  describe "POST 'LoginByUserFromMobile'" do
    it "returns http success" do
      post 'LoginByUserFromMobile'
      response.should be_success
    end
  end

end
