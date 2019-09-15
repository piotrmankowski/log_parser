# frozen_string_literal: true

module Actions
  class UniquePageViews < Base
    def processed_entries
      entries.transform_values { |views| views.uniq.count }
             .sort(&sort_entries)
    end

    def action_name
      'unique visits'
    end
  end
end
