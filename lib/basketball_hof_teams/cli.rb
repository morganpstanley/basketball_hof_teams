class BasketballHofTeams::CLI  
    
    def call
        BasketballHofTeams::Scraper.new.create_teams
        puts "Welcome! Here you may learn more about the Teams in the NBA Hall of Fame."
    end

    def main_index
        puts "Here are the #{BasketballHofTeams::Team.all.length} teams in the Hall of Fame:"
        BasketballHofTeams::Team.all.each_with_index do |team, index|
            puts "#{index+1} - #{team}"
        end
        puts "Type in the number of a team to learn more:"
        input = gets.strip
        # if show_team[input.to_i]
   

    def show_team
        puts ""
        puts ""
        puts "#{team.name}"
        puts "#{team.hof_date}"
        puts "#{team.description}"
        puts "#{team.facts}"
        puts ""
        puts ""
        puts "Would you like to see another team? (y/n)"
        input = gets.strip
    end

    if input == "y"
        self.main_index
    elsif input == "n"
        self.exit
    else 
        puts "Would you like to see another team? (y/n)"
        input = gets.strip
    end

    def exit 
        puts "Hope you learned something cool."
        puts "Exiting..."
    end

end