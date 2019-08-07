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
        input = check_input1(input)

        team = BasketballHofTeams::Team.find(input.to_i)
        show_team(team)

        puts puts "Would you like to see another team? (y/n)"
        input = gets.strip.downcase
        input = check_input2(input)

        if input == "y"
            run
        elsif input == "n"
            puts ""
            puts "Hope you learned something cool."
            puts "Exiting..."
            exit
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
        puts "--------------------------"
        puts "Team name: #{team.name}"
        puts "Enshrined: #{team.hof_date}"
        puts "Description:"
        puts "#{team.description}"
        puts ""
        puts "Facts:"
        i = 0
        while team.facts[i]
            puts "#{team.facts[i]}"
            i += 1
        end
        puts "--------------------------"
        puts ""
    end

    def check_input1(input)
        until (1..BasketballHofTeams::Team.all.length).include?(input)
            puts ""
            puts "That input doesn't match a team."
            puts "Type in the number of a team to learn more:"
            input = gets.strip.to_i
        end
        input
    end

    def check_input2(input)
        until input == "y" || input == "n"
            puts ""
            puts "I don't understand that input"
            puts "Would you like to see another team? (y/n)"
            input = gets.strip.downcase
        end
        input
    end

end