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

class Support < ActiveRecord::Base
	set_table_name 'support'

	belongs_to :businessinfo
end
