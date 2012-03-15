require 'spec_helper'

describe PushController do

  describe "GET 'android'" do
    it "returns http success" do
      get 'android'
      response.should be_success
    end
  end

  describe "GET 'ios'" do
    it "returns http success" do
      get 'ios'
      response.should be_success
    end
  end

end
