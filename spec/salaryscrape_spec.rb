require 'minitest/autorun'
require_relative '../lib/nbasalarayscrape/salaryscrape.rb'

# tests the head of the tables for all the teams
# tests that the player's value is not empty for all the teams
# tests the size of the array of hashes for all the teams
# tests that head_array and players_data_array are not empty when a team exists

# data that are expected

player = [{ 'Player' => 'Eric Bledsoe', '2014-15' => '$12,173,913',
            '2015-16' => '$13,086,957',
            '2016-17' => '$14,000,001',
            '2017-18' => '$14,913,045', '2018-19' => '$15,826,089',
            'Signed Using' => 'Bird Rights', 'Guaranteed' => '$70,000,000' },
          { 'Player' => 'Goran Dragic', '2014-15' => '$7,500,000',
            '2015-16' => '$7,500,000', '2016-17' => '',
            '2017-18' => '', '2018-19' => '',
            'Signed Using' => 'Cap Space', 'Guaranteed' => '$7,500,000' },
          { 'Player' => 'Isaiah Thomas', '2014-15' => '$7,238,606',
            '2015-16' => '$6,912,869', '2016-17' => '$6,587,132',
            '2017-18' => '$6,261,395', '2018-19' => '',
            'Signed Using' => '', 'Guaranteed' => '$27,000,002' },
          { 'Player' => 'P.J. Tucker', '2014-15' => '$5,700,000',
            '2015-16' => '$5,500,000', '2016-17' => '$5,300,000',
            '2017-18' => '', '2018-19' => '',
            'Signed Using' => 'Cap Space', 'Guaranteed' => '$12,700,000' },
          { 'Player' => 'Alex Len', '2014-15' => '$3,649,920',
            '2015-16' => '$3,807,120', '2016-17' => '$4,823,621',
            '2017-18' => '', '2018-19' => '',
            'Signed Using' => '1st Round Pick', 'Guaranteed' => '$3,649,920' },
          { 'Player' => 'Gerald Green', '2014-15' => '$3,500,000',
            '2015-16' => '', '2016-17' => '', '2017-18' => '',
            '2018-19' => '', 'Signed Using' => 'Cap Space',
            'Guaranteed' => '$3,500,000' },
          { 'Player' => 'Anthony Tolliver', '2014-15' => '$3,000,000',
            '2015-16' => '$3,000,000', '2016-17' => '', '2017-18' => '',
            '2018-19' => '', 'Signed Using' => 'Cap Space',
            'Guaranteed' => '$3,400,000' },
          { 'Player' => 'Markieff Morris', '2014-15' => '$2,989,239',
            '2015-16' => '$8,000,000', '2016-17' => '$8,000,000',
            '2017-18' => '$8,000,000', '2018-19' => '$8,000,000',
            'Signed Using' => 'Bird Rights', 'Guaranteed' => '$34,989,239' },
          { 'Player' => 'Marcus Morris', '2014-15' => '$2,943,221',
            '2015-16' => '$5,000,000', '2016-17' => '$5,000,000',
            '2017-18' => '$5,000,000', '2018-19' => '$5,000,000',
            'Signed Using' => 'Bird Rights', 'Guaranteed' => '$22,943,221' },
          { 'Player' => 'Zoran Dragic', '2014-15' => '$1,962,103',
            '2015-16' => '$2,050,397', '2016-17' => '', '2017-18' => '',
            '2018-19' => '', 'Signed Using' => 'Cap Space',
            'Guaranteed' => '$4,012,500' },
          { 'Player' => 'T.J. Warren', '2014-15' => '$1,953,120',
            '2015-16' => '$2,041,080', '2016-17' => '$2,128,920',
            '2017-18' => '$3,152,931', '2018-19' => '',
            'Signed Using' => '1st Round Pick',
            'Guaranteed' => '$3,994,200' },
          { 'Player' => 'Tyler Ennis', '2014-15' => '$1,590,720',
            '2015-16' => '$1,662,360', '2016-17' => '$1,733,880',
            '2017-18' => '$2,666,707', '2018-19' => '',
            'Signed Using' => '1st Round Pick', 'Guaranteed' => '$3,253,080' },
          { 'Player' => 'Shavlik Randolph', '2014-15' => '$1,227,985',
            '2015-16' => '', '2016-17' => '', '2017-18' => '', '2018-19' => '',
            'Signed Using' => 'Minimum Salary', 'Guaranteed' => '' },
          { 'Player' => 'Miles Plumlee', '2014-15' => '$1,169,880',
            '2015-16' => '$2,109,294', '2016-17' => '', '2017-18' => '',
            '2018-19' => '', 'Signed Using' => '1st Round Pick',
            'Guaranteed' => '$1,169,880' },
          { 'Player' => 'Archie Goodwin', '2014-15' => '$1,112,280',
            '2015-16' => '$1,160,160', '2016-17' => '$2,094,089',
            '2017-18' => '', '2018-19' => '',
            'Signed Using' => '1st Round Pick',
            'Guaranteed' => '$1,112,280' },
          { 'Player' => 'Earl Barron', '2014-15' => '$1,310,286',
            '2015-16' => '', '2016-17' => '', '2017-18' => '',
            '2018-19' => '', 'Signed Using' => 'Minimum Salary',
            'Guaranteed' => '' },
          { 'Player' => 'Josh Childress', '2014-15' => '$7,610,000',
            '2015-16' => '', '2016-17' => '', '2017-18' => '', '2018-19' => '',
            'Signed Using' => '', 'Guaranteed' => '' },
          { 'Player' => 'Michael Beasley', '2014-15' => '$777,778',
            '2015-16' => '$777,778', '2016-17' => '$777,778', '2017-18' => '',
            '2018-19' => '', 'Signed Using' => '', 'Guaranteed' => '' }]

heads_of_tables = ['Player', '2014-15', '2015-16',
                   '2016-17', '2017-18', '2018-19',
                   'Signed Using', 'Guaranteed']

# data that have to be compared with the expected one

players = SalaryScraper::BasketballReference.new
players_found = players.to_array_of_hashes('PHO')
heads = players.head_array('PHO')
players_data = players.players_data_array('PHO')

# tests start

describe 'Get the head of the tables', 'For all the teams' do
  it 'has the right size' do
    heads.size.must_equal heads_of_tables.size
  end
  it 'has the right values' do
    heads.must_equal heads_of_tables
  end
end

describe 'Get players data' do
  it 'is not empty' do
    players_data.wont_be_empty
  end
  it 'has not empty players name' do
    players_data.first.wont_be_empty
  end
end

describe 'Get all the players' do
  it 'has the right number of players' do
    players_found.size.must_equal player.size
  end
  it 'has all team data' do
    player.each_index do | player_array |
      player[player_array].map do | key, value |
        players_found[player_array][key].must_equal value
      end
    end
  end

end
