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
heads = []
players = SalaryScraper::BasketballReference.new

all_teams.each do |team|
	heads << players.head_array(team)
end

#tests start
describe "Get the head of the tables", "For all the teams" do
	heads.each do |head_for_a_team|
		it "has the right size" do
			head_for_a_team.size.must_equal heads_of_tables.size
		end

		head_for_a_team.each_index do |i|  
			it "has the right values" do
				head_for_a_team[i].must_equal heads_of_tables[i]
			end
		end
	end
end


