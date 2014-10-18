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
players_data = []
players = SalaryScraper::BasketballReference.new

all_teams.each do |team|
	players_data << players.players_data_array(team)
end

#tests start
describe "Get players data" do
	players_data.each do |players_for_a_team|
		it "is not empty" do
			players_for_a_team.wont_be_empty
		end

		it "has not empty players name" do
			players_for_a_team.first.wont_be_empty
		end
	end

end


