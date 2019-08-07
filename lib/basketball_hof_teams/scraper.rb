class BasketballHofTeams::Scraper
    WEBSITE = "http://www.hoophall.com/hall-of-famers/browse/?teams=true&yr=&country=&loc=&team=&college=&position=&height="

    def get_page
        Nokogiri::HTML(open(WEBSITE))
    end

    def scrape_teams
        get_page.css("div.hof-search-res-item")
    end

    def create_teams
        scrape_teams.each do |team|
            BasketballHofTeams::Team.new_from_scraper(team)
        end
    end
end