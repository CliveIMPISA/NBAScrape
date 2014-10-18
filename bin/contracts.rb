
fail ArgumentError, "Usage: ruby contracts.rb [teamname]\n
Please check the readme file for team names abbreviation\n" if ARGV.count == 0

team_name = ARGV[0]
require_relative '../lib/salaryscrape'
include SalaryScraper

code = BasketballReference.new

if code.check_if_team_exist(team_name)
  puts code.to_yaml(team_name)
else
  puts 'This team does not exist.'
  puts 'Please check the readme file for team names abbreviation.'
end
