# frozen_string_literal: true

module WebserverLog
  class Parser
    attr_reader :file_path, :log_hash

    def initialize(file_path)
      raise ArgumentError, 'Please provide a file.' if file_path.nil?
      raise ArgumentError, 'Please provide an existing file.' unless File.exist?(file_path)

      @file_path = file_path
      @log_hash = {}
    end

    def parse_log
      generate_log_hash
      log_hash
    end

    private

    def generate_log_hash
      File.open(file_path).each do |line|
        page, ip = line.split(' ')
        update_log_hash(page, ip)
      end
    end

    def update_log_hash(page, ip)
      if log_hash.key?(page)
        log_hash[page][ip] = log_hash[page].key?(ip) ? log_hash[page][ip] + 1 : 1
      else
        log_hash[page] = Hash[ip, 1]
      end
    end
  end
end
