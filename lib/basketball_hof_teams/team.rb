require 'pry'

class BasketballHofTeams::Team 
    attr_accessor :name, :description, :hof_date, :facts, :url

    def self.new_from_scraper(team)
        binding.pry
        self.new(team.css("span.hof-res-lbl")[0].text, team.css(".hof-search-res-overlay")[0]["href"])
    end

    #ruby bin/basketball_hof_teams

    def initialize(name, url)
        @name = name
        @url = "http://www.hoophall.com#{url}"
        binding.pry
    end

    def description
        @description = @doc.css("p.p1").text
    end

    def hof_date
        @hof_date = @doc.css("span.stat-cat-label").text
    end


    def doc
        @doc = Nokogiri::HTML(open(self.url))
    end

end