# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parser do
  let(:file_path) { File.join('spec', 'fixtures', 'sample.log') }
  subject { described_class.new(file_path) }

  describe '#call' do
    let(:expected_result) do
      "/help_page/1 5 visits\n" \
      "/contact 2 visits\n" \
      "/home 2 visits\n" \
      "/about/2 1 visits\n" \
      "/index 1 visits\n" \
      "/about 1 visits\n" \
      "----------------------------------\n" \
      "/help_page/1 5 unique visits\n" \
      "/home 2 unique visits\n" \
      "/contact 1 unique visits\n" \
      "/about/2 1 unique visits\n" \
      "/index 1 unique visits\n" \
      "/about 1 unique visits\n" \
    end

    it 'displays proper data' do
      expect { subject.call }.to output(expected_result).to_stdout
    end
  end
end
