require 'spec_helper'

describe AuthController do

  describe "GET 'LoginByFacebookFromMobile'" do
    it "returns http success" do
      get 'LoginByFacebookFromMobile'
      response.should be_success
    end
  end

  describe "GET 'LoginByTokenFromMobile'" do
    it "returns http success" do
      get 'LoginByTokenFromMobile'
      response.should be_success
    end
  end

  describe "GET 'LoginByUserFromMobile'" do
    it "returns http success" do
      get 'LoginByUserFromMobile'
      response.should be_success
    end
  end

end
