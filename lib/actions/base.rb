# frozen_string_literal: true

module Actions
  class Base
    attr_reader :entries

    def initialize(entries)
      @entries = entries
    end

    def call
      processed_entries.each do |url, visits|
        puts "#{url} #{visits} #{action_name}"
      end
    end

    private

    def processed_entries
      raise NotImplementedError
    end

    def action_name
      raise NotImplementedError
    end

    def sort_entries
      proc { |e1, e2| e2[1] <=> e1[1] }
    end
  end
end
