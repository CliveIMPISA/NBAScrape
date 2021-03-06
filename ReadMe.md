nbasalaryscrape
===============
[![Gem Version](https://badge.fury.io/rb/nbasalaryscrape.svg)](http://badge.fury.io/rb/nbasalaryscrape)
[![Build Status](https://travis-ci.org/CliveIMPISA/nbasalaryscrape.svg?branch=master)](https://travis-ci.org/CliveIMPISA/nbasalaryscrape)


nbasalaryscrape grabs the salary and contract information of National Basketball Association(NBA) players from [basketball-reference.com](http://www.basketball-reference.com). This information is then written to yaml file. Included in this project is a sample of a generated yaml file of one of the teams salary information
## About

The information (that can be stored in the yaml file) contains a list of the players and their contractual arrangement on any particular NBA team. How is that information useful? Every year, the NBA sets a salary cap- which is the maximum amount of money a team can pay all its players combined without facing any penalties. Knowing contractual agreements can give teams an idea of potential cost cutting measures or cap space available for signing additional players. If you are a just a fan and only want to know what you favorite player is earning, this application can immediately generate this information for you. For more information on the nba salary cap visit [NBA Salary cap](http://en.wikipedia.org/wiki/NBA_salary_cap)
## Usage

This gem may be used as a command line utility or called from code

###CLI

Type nbasalaryscrape and provide one of the team abbreviations. Below is a list of the thirty teams and their abbreviations.
````ruby
% nbasalaryscrape PHO
````
To store the content in a yaml, just add a second argument as a output
````ruby
% nbasalaryscrape BOS  your_yaml_file.yml
````
###Call from ruby code

````ruby
  require 'nbasalaryscrape'

  team = SalaryScraper::BasketballReference.new

  puts team.to_array_of_hashes('PHO') #return players' data in an array of hashes
  puts team.to_yaml('PHO') #return the same data in a yaml format
````

##Abbreviations

|  Team Name |Abbreviation  |
|:---------------:|:-----:|
|Pheonix Suns|PHO|
|Miami Heat|MIA|
|Atlanta Hawks |ATL|
|Boston Celtics|BOS|
|Brooklyn Nets|BRK|
|Chicago Bulls|CHI|
|Cleveland Cavaliers|CLE|
|Dallas Mavericks|DAL|
|Denver Nuggets|DEN|
|Golden State Warriors|GSW|
|Detroit Pistons|DET|
|Los Angeles Lakers|LAL|
|Los Angeles Clippers|LAC|
|Houston Rockets|HOU|
|Indiana Pacers|IND|
|Minnesota Timberwolves|MIN|
|Memphis Grizzlies| MEM|
|Milwuakee Bucks| MIL|
|New Orleans Pelicans| NOP|
|New York Knicks|NYK|
|Oklahoma City Thunder|OKC|
|Sacramento Kings| SAC|
|Washington Wizards|WAS|
|Utah Jazz| UTA|
|San Antonio Spurs|SAS|
|Toronto Raptors|TOR|
|Philadephia 76ers|PHI|
|Portland TrailBlazers|POR|
|Orlando Magic|ORL|
|Charlotte Hornets|CHO|
