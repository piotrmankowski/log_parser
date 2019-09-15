# frozen_string_literal: true

require_relative 'actions/base'
require_relative 'actions/page_views'
require_relative 'actions/unique_page_views'
require_relative 'file_reader'

class Parser
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def call
    Actions::PageViews.new(entries).call
    puts '----------------------------------'
    Actions::UniquePageViews.new(entries).call
  end

  private

  def entries
    @entries ||= FileReader.new(file_path).call
  end
end
