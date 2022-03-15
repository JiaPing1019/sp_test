# frozen_string_literal: true

module WebserverLog
  class Formatter
    attr_accessor :error
    attr_reader :log_hash

    def initialize(log_hash)
      @log_hash = log_hash
      @error = nil
    end

    def format(uniq: false)
      if uniq
        sort_by_most_uniq_views
      else
        sort_by_most_views
      end
    rescue StandardError => e
      @error = "#{e.class}. Wrong log hash format: \n#{@log_hash}"
    end

    private

    def sort_by_most_views
      log_hash.map { |page, visits| [page, visits.values.sum] }.sort_by { |_k, v| v }.reverse!
    end

    def sort_by_most_uniq_views
      log_hash.map { |page, visits| [page, visits.keys.size] }.sort_by { |_k, v| v }.reverse!
    end
  end
end
