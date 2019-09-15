# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FileReader do
  subject { described_class.new(file_path) }

  describe '#call' do
    context 'when file exists' do
      let(:file_path) { File.join('spec', 'fixtures', 'sample.log') }
      let(:expected_result) do
        {
          '/help_page/1' => ['126.318.035.038', '929.398.951.889', '722.247.931.582', '646.865.545.408', '543.910.244.929'],
          '/contact' => ['184.123.665.067', '184.123.665.067'],
          '/home' => ['184.123.665.067', '235.313.352.950'],
          '/about/2' => ['444.701.448.104'],
          '/index' => ['444.701.448.104'],
          '/about' => ['061.945.150.735']
        }
      end

      it 'returns proper data' do
        expect(subject.call).to match(expected_result)
      end
    end

    context 'when file does not exist' do
      let(:file_path) { File.join('spec', 'fixtures', 'non_existing.log') }

      it 'raises an error' do
        expect { subject.call }.to raise_error(Errno::ENOENT)
      end
    end
  end
end
