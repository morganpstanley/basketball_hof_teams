class BasketballHofTeams::CLI  
    
    def call
        BasketballHofTeams::Scraper.new.create_teams
        puts "Welcome! Here you may learn more about the Teams in the NBA Hall of Fame."
        run
    end

    def run

        main_index

        puts "Type in the number of a team to learn more:"
        input = gets.strip.to_i

       team = BasketballHofTeams::Team.find(input.to_i)

       show_team(team)

       input = gets.strip.to_i
       if input =="y"
        self.run
       elsif input == "n"
        puts ""
        puts "Hope you learned something cool."
        puts "Exiting..."
       else
        puts "I don't understand that input"
        
       end
    end

    def main_index
        puts ""
        puts "Here are the #{BasketballHofTeams::Team.all.length} teams in the Hall of Fame:"
        puts ""
        BasketballHofTeams::Team.all.each_with_index do |team, index|
            puts "#{index+1} - #{team.name}"
        end
        puts ""
    end

    def show_team(team)
        puts ""
        puts ""
        puts "Team name - #{team.name}"
        puts "Enshrined - #{team.hof_date}"
        puts "Description -"
        puts "#{team.description}"
        puts ""
        puts "----------Facts-----------"
        i = 0
        while team.facts[i]
            puts "#{team.facts[i]}"
            i += 1
        end
        puts "--------------------------"
        puts ""
        puts "Would you like to see another team? (y/n)"
    end

end