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

my_game = Game.new(gets.chomp)

while my_game.human_player.life_points > 0 && my_game.enemies.size != 0
    my_game.menu_choice(my_game.menu)
    my_game.enemies_attack
    my_game.end if !my_game.is_still_ongoing?
end