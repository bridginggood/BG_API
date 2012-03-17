require 'spec_helper'

describe BusinessDetailsController do

  describe "GET 'read'" do
    it "returns http success" do
      get 'read'
      response.should be_success
    end
  end

end
