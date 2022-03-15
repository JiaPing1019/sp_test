require './lib/webserver_log/parser'
require './lib/webserver_log/formatter'

if ARGV.empty?
  puts 'Please provide a log file!'
  exit 1
end

parser = WebserverLog::Parser.new(ARGV[0])
log_hash = parser.parse_log

puts '-- LOG REPORT --'
puts "\r"
puts 'List if webpages with most page views ordered from most pages views to less page views (webpage: visits):'
puts WebserverLog::Formatter.new(log_hash).format
puts "\r"
puts '-------------------'
puts "\r"
puts 'List of webpages with most unique page views to less unique page views (webpage: unique views):'
puts WebserverLog::Formatter.new(log_hash).format(uniq: true)
