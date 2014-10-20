require 'nokogiri'
require 'open-uri'
require 'yaml'

module SalaryScraper
  # Class Pulls and Manipulates data from basketball-reference.com
  class BasketballReference
    WEBSITE = 'http://www.basketball-reference.com/contracts'
    PAYROLL = "//div[@id='div_payroll']//tbody//tr[@class='']//td"
    HEAD = "//div[@id='div_payroll']//thead//tr[@class='']//th"
<<<<<<< HEAD
    
=======
>>>>>>> d62b0730bcb45ce356cbf88cd4f7e3c32fd14924
    def get_team(team)
      doc = get_page(team)
      doc.xpath(PAYROLL)
    end

    def get_page(team)
      url = "#{WEBSITE}/#{team}.html"
      Nokogiri::HTML(open(url))
    end

    def just_text(data)
      textes_array = []
      data.each { |t| textes_array << t.text }
      textes_array
    end

    def get_column_heads(team)
      doc = get_page(team)
      doc.xpath(HEAD)
    end

    def head_array(team)
      @head_array = []
      head = get_column_heads(team)
      head.each { |x| @head_array << x.text }
      @head_array
    end

    def players_data_array(team)
      @players_data_array = []
      players_data = get_team(team)
      players_data.each { |x| @players_data_array << x.text }
      @players_data_array
    end

    def to_array_of_hashes(team)
      players_array = players_data_array(team)
      header_array = head_array(team)
      assign_key_to_value(number_arrays, players_array, header_array)
    end

    def assign_key_to_value(number_arrays, players_data_array, head_array)
      data = []
      number_arrays.times do
        piece_of_data = Hash.new
        head_array.each do |x|
          piece_of_data[x] = players_data_array.first
          players_data_array.shift
        end
        data << piece_of_data
      end
      data
    end

    def number_arrays
      @players_data_array.size / @head_array.size
    end

    def to_yaml(team)
      data = to_array_of_hashes(team)
      data.to_yaml
    end

    def check_if_team_exist(team)
      if head_array(team).size == 0 || players_data_array(team).size == 0
        return false
      else
        return true
      end
    end
  end
end
