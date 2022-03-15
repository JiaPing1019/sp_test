# frozen_string_literal: true

require 'spec_helper'
require 'webserver_log/parser'

RSpec.describe WebserverLog::Parser do
  describe '#initialize' do
    context 'when file is not provided' do
      it 'raises an error' do
        expect { described_class.new(nil) }.to raise_error(ArgumentError, 'Please provide a file.')
      end
    end

    context 'when the file not exists' do
      it 'raises an error' do
        expect { described_class.new('spec/fixtures/wrong_webserver.log') }.to raise_error(ArgumentError,  'Please provide an existing file.')
      end
    end
  end

  describe '#parse_log' do
    subject { described_class.new(file_path) }

    context 'when file is provided' do
      let(:file_path) { 'spec/fixtures/webserver.log' }

      let(:result) do
        {
          '/help_page/1' => {
            '126.318.035.038' => 1,
            '929.398.951.889' => 1,
            '722.247.931.582' => 1
          },
          '/about/2' => {
            '184.123.665.067' => 1,
            '444.701.448.104' => 2
          },
          '/about' => {
            '061.945.150.735' => 1
          },
          '/index' => {
            '444.701.448.104' => 3
          }
        }
      end

      it 'returns log hash' do
        expect(subject.parse_log).to eq(result)
      end
    end
  end
end
