# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "business_dtl", :primary_key => "BusinessId", :force => true do |t|
    t.string "BusinessRep", :limit => 50, :null => false
    t.string "YelpId",      :limit => 50
  end

  create_table "business_info", :primary_key => "BusinessId", :force => true do |t|
    t.string    "BusinessName",     :limit => 25,  :null => false
    t.string    "BusinessAddress",  :limit => 100, :null => false
    t.string    "BusinessPhone",    :limit => 25,  :null => false
    t.float     "Latitude",                        :null => false
    t.float     "Longitude",                       :null => false
    t.string    "BusinessCategory", :limit => 5,   :null => false
    t.timestamp "CreatedAt",                       :null => false
    t.string    "CreatedBy",        :limit => 10
    t.timestamp "UpdatedAt",                       :null => false
    t.string    "UpdatedBy",        :limit => 10
  end

  add_index "business_info", ["BusinessId"], :name => "businessId_UNIQUE", :unique => true

  create_table "charity_info", :primary_key => "CharityId", :force => true do |t|
    t.string    "CharityName",    :limit => 25,  :null => false
    t.string    "CharityAddress", :limit => 100, :null => false
    t.string    "CharityPhone",   :limit => 25,  :null => false
    t.string    "CharityRep",     :limit => 50,  :null => false
    t.string    "CharityCause",   :limit => 5,   :null => false
    t.string    "CharityURL",     :limit => 50
    t.string    "CharityEmail",   :limit => 50,  :null => false
    t.timestamp "CreatedAt",                     :null => false
    t.string    "CreatedBy",      :limit => 10
    t.timestamp "UpdatedAt",                     :null => false
    t.string    "UpdatedBy",      :limit => 10
  end

  add_index "charity_info", ["CharityId"], :name => "charityId_UNIQUE", :unique => true

  create_table "support", :primary_key => "SupportId", :force => true do |t|
    t.string    "BusinessId",     :limit => 10, :null => false
    t.string    "CharityId",      :limit => 10, :null => false
    t.float     "DonationAmount",               :null => false
    t.timestamp "BeginDate",                    :null => false
    t.timestamp "EndDate",                      :null => false
    t.timestamp "CreatedAt",                    :null => false
    t.string    "CreatedBy",      :limit => 10
    t.timestamp "UpdatedAt",                    :null => false
    t.string    "UpdatedBy",      :limit => 10
  end

  add_index "support", ["BusinessId"], :name => "fk_SUPPORT_BUSINESS_INFO"
  add_index "support", ["CharityId"], :name => "fk_SUPPORT_CHARITY_INFO1"
  add_index "support", ["SupportId"], :name => "supportId_UNIQUE", :unique => true

  create_table "transaction", :primary_key => "TransactionId", :force => true do |t|
    t.integer   "SupportId",                     :null => false
    t.string    "UserId",          :limit => 10, :null => false
    t.timestamp "TransactionDate",               :null => false
  end

  add_index "transaction", ["SupportId"], :name => "fk_TRANSACTION_SUPPORT1"
  add_index "transaction", ["TransactionId"], :name => "transactionId_UNIQUE", :unique => true
  add_index "transaction", ["UserId"], :name => "fk_TRANSACTION_USER_INFO1"

  create_table "user_info", :primary_key => "UserId", :force => true do |t|
    t.string    "UserEmail",     :limit => 50, :null => false
    t.string    "UserType",      :limit => 5,  :null => false
    t.string    "UserPassword",  :limit => 50
    t.string    "UserSalt",      :limit => 50
    t.string    "UserFirstName", :limit => 25, :null => false
    t.string    "UserLastName",  :limit => 25, :null => false
    t.timestamp "CreatedAt",                   :null => false
    t.string    "CreatedBy",     :limit => 10
    t.timestamp "UpdatedAt",                   :null => false
    t.string    "UpdatedBy",     :limit => 10
  end

  add_index "user_info", ["UserEmail"], :name => "UserEmail_UNIQUE", :unique => true
  add_index "user_info", ["UserId"], :name => "userId_UNIQUE", :unique => true

end
