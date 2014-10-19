require 'minitest/autorun'
require './lib/salaryscrape.rb'

#data that are expected
all_teams = ['PHO','MIA','ATL','BOS','BRK','CHI','CLE','DAL',
			'DEN','GSW','DET','LAL','LAC','HOU','IND','MIN',
			'MEM','MIL','NOP','NYK','OKC','SAC','WAS','UTA',
			'SAS','TOR','PHI','POR','ORL','CHO']
heads_of_tables = ["Player", "2014-15", "2015-16", "2016-17",
				   "2017-18", "2018-19", "Signed Using", "Guaranteed"]
#data that have to be compared with the expected one
array_of_hashes = []
players = SalaryScraper::BasketballReference.new

all_teams.each do |team|
	array_of_hashes << players.to_array_of_hashes(team)
end

#tests start
describe "Get the array of hashes" do
	array_of_hashes.each do |array_of_hashes_of_each_team|
		it "has the right size" do
			array_of_hashes_of_each_team.size.must_be :>, 14
		end
	end
end



