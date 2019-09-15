# frozen_string_literal: true

module Actions
  class PageViews < Base
    def processed_entries
      entries.transform_values(&:count)
             .sort(&sort_entries)
    end

    def action_name
      'visits'
    end
  end
end
