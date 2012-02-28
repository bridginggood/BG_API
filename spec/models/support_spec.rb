# == Schema Information
#
# Table name: support
#
#  SupportId      :integer(4)      not null, primary key
#  BusinessId     :integer(8)      not null
#  CharityId      :integer(8)      not null
#  DonationAmount :float           not null
#  BeginDate      :timestamp       not null
#  EndDate        :timestamp       not null
#  CreatedAt      :timestamp       not null
#  CreatedBy      :string(10)
#  UpdatedAt      :timestamp       not null
#  UpdatedBy      :string(10)
#

require 'spec_helper'

describe Support do
  pending "add some examples to (or delete) #{__FILE__}"
end
