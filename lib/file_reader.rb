# frozen_string_literal: true

class FileReader
  attr_reader :file_path, :entries

  def initialize(file_path)
    @file_path = file_path
    @entries = {}
  end

  def call
    file.each_line do |line|
      url, ip_address = line.split

      entries[url] ||= []
      entries[url].push(ip_address)
    end

    entries
  end

  private

  def file
    File.open(file_path, 'r')
  end
end
