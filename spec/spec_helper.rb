# frozen_string_literal: true

require 'bundler/setup'
require 'promptjoy-ruby'
require 'rspec'
require 'webmock/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
