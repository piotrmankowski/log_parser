# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Actions::UniquePageViews do
  let(:entries) do
    {
      '/test_1' => %w[127.0.0.3 127.0.0.3 127.0.0.3],
      '/test_2' => %w[127.0.0.1 127.0.0.1 127.0.0.1 127.0.0.2],
      '/test_3' => %w[127.0.0.5 127.0.0.6 127.0.0.7]
    }
  end

  subject { described_class.new(entries) }

  describe '#call' do
    let(:expected_result) do
      "/test_3 3 unique visits\n" \
      "/test_2 2 unique visits\n" \
      "/test_1 1 unique visits\n" \
    end

    it 'displays proper data' do
      expect { subject.call }.to output(expected_result).to_stdout
    end
  end
end
