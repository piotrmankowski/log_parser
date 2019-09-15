# frozen_string_literal: true

require 'bundler/setup'
require 'pry'

require_relative '../lib/parser.rb'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.order = :random

  Kernel.srand config.seed

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
    mocks.verify_doubled_constant_names = true
  end
end
