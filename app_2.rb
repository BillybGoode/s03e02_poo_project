require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts ""
puts "Veuillez entrer votre pseudo combattant !!!"
print " >> "

player = HumanPlayer.new(gets.chomp) 

bot1 = Player.new('Josiane')
bot2 = Player.new('José')
enemies = [bot1, bot2]

while player.life_points > 0 && (bot1.life_points > 0 || bot2.life_points > 0)
    puts "#{player.show_state}"
    puts "///// Quelle action veux-tu effectuer ? /////"
    puts ""
    puts "   a - chercher une meilleure arme"
    puts "   s - chercher à se soigner"
    puts ""
    puts "attaquer un joueur en vue :"
    for i in 0..enemies.size-1
        puts "   #{i} - #{enemies[i].show_state}"
    end
    puts "_____________________________________________"
    print "\n >> "
    player_input = gets.chomp
    case player_input
    when "a"
        player.search_weapon
    when "s"
        player.search_health_pack
    else
        player.attacks(enemies[player_input.to_i])
    end
    print "\n"
    puts "Les autres joueurs t'attaquent !"
    enemies.each {|enemy| enemy.attacks(player) if enemy.life_points > 0}

    binding.pry
end

puts "La partie est finie"
if player.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"  
else
    puts "Loser ! Tu as perdu !" 
end

binding.pry