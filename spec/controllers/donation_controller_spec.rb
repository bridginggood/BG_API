require 'spec_helper'

describe DonationController do

  describe "GET 'MakeDonation'" do
    it "returns http success" do
      get 'MakeDonation'
      response.should be_success
    end
  end

end
