# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Api::Application.initialize!
ActiveRecord::Base.pluralize_table_names = false

require 'will_paginate'
#require 'apn_on_rails'
