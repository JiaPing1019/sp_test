# frozen_string_literal: true

require 'spec_helper'
require 'webserver_log/formatter'

RSpec.describe WebserverLog::Formatter do
  subject { described_class.new(log_hash) }

  let(:log_hash) do
    {
      '/help_page/1' => {
        '126.318.035.038' => 1,
        '929.398.951.889' => 1
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

  describe 'sort by most views' do
    let(:result) do
      [
        ['/index', 3],
        ['/about/2', 3],
        ['/help_page/1', 2],
        ['/about', 1]
      ]
    end

    it 'returns the correct format' do
      expect(subject.format).to eq(result)
    end
  end

  describe 'sort by most uniq views' do
    let(:result) do
      [
        ['/about/2', 2],
        ['/help_page/1', 2],
        ['/index', 1],
        ['/about', 1]
      ]
    end

    it 'return result' do
      expect(subject.format(uniq: true)).to eq(result)
    end
  end

  describe 'when malformed data exists' do
    let(:log_hash) do
      {
        '/help_page/1' => [
          '126.318.035.038',
          '929.398.951.889'
        ],
        '/about/2' => [
          '444.701.448.104'
        ]
      }
    end

    it 'has error message' do
      subject.format
      expect(subject.error.nil?).to eq(false)
    end
  end
end
