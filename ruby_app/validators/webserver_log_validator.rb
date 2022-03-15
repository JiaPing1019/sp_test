# frozen_string_literal: true

require_relative 'base_validator'

module Validators
  class WebserverLogValidator < BaseValidator
    class FormatError < StandardError; end

    def validate(line)
      path, ip = line.split(' ')

      raise FormatError, "The format of the path is incorrect. Line details: #{line}" unless path_valid?(path)
      raise FormatError, "The format of the ip is incorrect. Line details: #{line}" unless ip_valid?(ip)
    end

    private

    def path_valid?(path)
      %r{/\S+$}.match?(path)
    end

    def ip_valid?(ip)
      %r{\d+\.\d+\.\d+\.\d+$}.match?(ip)
    end
  end
end
