require 'minitest/autorun'
require './lib/salaryscrape.rb'

=begin
tests the head of the tables for all the teams
tests that the player's value is not empty for all the teams
tests the size of the array of hashes for all the teams
tests that head_array and players_data_array are not empty when a team exists 
=end

#data that are expected
all_teams = ['PHO','MIA','ATL','BOS','BRK','CHI','CLE','DAL',
			'DEN','GSW','DET','LAL','LAC','HOU','IND','MIN',
			'MEM','MIL','NOP','NYK','OKC','SAC','WAS','UTA',
			'SAS','TOR','PHI','POR','ORL','CHO']
heads_of_tables = ['Player', '2014-15', '2015-16', '2016-17',
				   '2017-18', '2018-19', 'Signed Using', 'Guaranteed']
#data that have to be compared with the expected one
heads = []
players = []
array_of_hashes = []

all_teams.each do |team|
	heads << SalaryScraper::BasketballReference.head_array(team)
	players << SalaryScraper::BasketballReference.players_data_array(team)
	array_of_hashes << SalaryScraper::BasketballReference.to_array_of_hashes(team)
end

#tests start
describe "Get the head of the tables", "For all the teams" do
	heads.each do |head_for_a_team|
		it "has the right size" do
			head_for_a_team.size.must_equal heads_of_tables.size
		end

		it "has the right values" do
			head_for_a_team.must_be_same_as heads_of_tables
		end
	end
end

describe "Get players data" do
	players.each do |players_for_a_team|
		it "is not empty" do
			players_for_a_team.wont_be_empty
		end

		it "has not empty players name" do
			players_for_a_team.first.wont_be_empty
		end
	end

end

describe "Get the array of hashes" do
	array_of_hashes.each do |array_of_hashes_of_each_team|
		it "has the right size" do
			array_of_hashes_of_each_team.get_number_arrays.must_equal 16
		end
	end
end




