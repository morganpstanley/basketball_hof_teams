class BasketballHofTeams::Team 
    attr_accessor :name, :description, :hof_date, :facts, :url, :doc

    @@all = []

    def self.new_from_scraper(team)
        self.new(team.css("span.hof-res-lbl")[0].text, 
        "http://www.hoophall.com#{team.css(".hof-search-res-overlay")[0]["href"]}")
    end

    def initialize(name=nil, url=nil)
        @name = name
        @url = url
        @@all << self
    end

    def description
        description ||= doc.css("p.p1").text
    end

    def hof_date 
        hof_date ||= doc.css("span.stat-cat-label").text
    end

    def facts
        @facts = []
        i = 0
        while doc.css("div.stat-item")[i]
            @facts << doc.css("div.stat-item")[i].to_s.gsub(/<(.*?[^>])>/){|s| s = " "}.strip.gsub("\n\t", "-")
            i += 1
        end 
        @facts
    end

    def self.find(team)
        self.all[team-1]
    end

    def doc
        @doc ||=  Nokogiri::HTML(open(self.url))
    end

    def self.all
        @@all
    end

end