require_relative 'player'

class Game < Player
  attr_accessor :human_player, :enemies

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @enemies = []
    for i in 0..3
      @enemies << Player.new("bot#{i}")
    end
  end

  def kill_player(player)
    @enemies.delete(player)
  end

  def is_still_ongoing?
    @human_player.life_points > 0 && @enemies.size != 0 ? true : false
  end

  def show_players
    print @human_player.show_state + " et il reste #{@enemies.size + 1} ennemis."
  end

  def menu
    puts "#{@human_player.show_state}"
    puts "///// Quelle action veux-tu effectuer ? /////"
    puts ""
    puts "   a - chercher une meilleure arme"
    puts "   s - chercher à se soigner"
    puts ""
    puts "attaquer un joueur en vue :"
    @enemies.each.with_index do |enemy, i|
        puts "   #{i} - #{enemy.name} a #{enemy.life_points} points de vie."
    end
    puts "_____________________________________________"

    # check if player input is valid
    wrong_input_made = true
    while wrong_input_made
      print "\n >> "
      player_input = gets.chomp
      wrong_input_made = false if player_input == "a" || player_input == "s"
      for i in 0..@enemies.size-1
        wrong_input_made = false if player_input == i.to_s
      end
      print "Invalid choice input... try again." if wrong_input_made
    end

    player_input
  end

  def menu_choice(string_input)
    case string_input
    when "a"
        @human_player.search_weapon
    when "s"
        @human_player.search_health_pack
    else
        enemy = enemies[string_input.to_i]
        @human_player.attacks(enemy)
        kill_player(enemy) if enemy.life_points <= 0
    end
  end

  def enemies_attack
    puts "Les autres joueurs t'attaquent !"
    @enemies.each {|enemy| enemy.attacks(@human_player)}
  end

  def end
    puts "La partie est finie"
      if @human_player.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"  
      else
    puts "Loser ! Tu as perdu !" 
      end
  end
end