# frozen_string_literal: true
require 'bundler/setup'
require 'active_remote/bulk'

require 'pry'

$LOAD_PATH << ::File.expand_path('../support/protobuf', __FILE__)
require 'support/protobuf'
require 'support/models'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
