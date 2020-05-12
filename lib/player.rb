class Player
  attr_accessor :name, :life_points

  def initialize(name_input)
    @name = name_input
    @life_points = 10 # everyplayer starts with 10hp
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie."
  end

  # damage received = substract life point and check if player dies
  def gets_damage(amount_damage_received)
    @life_points -= amount_damage_received
    puts "le joueur #{@name} a été tué!" if @life_points <= 0
  end

  # p1 attacks p2 for some damage, substract HP and "puts" everything
  def attacks(atkd_player)
    puts "le joueur #{@name} attaque le joueur #{atkd_player.name}"
    damage_done = compute_damage
    puts "il lui inflige #{damage_done} points de dommages"
    atkd_player.gets_damage(damage_done)
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name_input)
    @name = name_input
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon > @weapon_level
      @weapon_level = new_weapon 
      puts 'un message du genre "Youhou ! elle est meilleure que ton arme actuelle : tu la prends.'
    else
      puts 'un petit "M@*#$... elle n\'est pas mieux que ton arme actuelle..."'
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    case health_pack
    when 1
        puts "Tu n'as rien trouvé... "
    when 2..5
        if @life_points <= 50
            @life_points += 50
        else
            @life_points = 100
        end
        puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    when 6
        if @life_points <= 20
            @life_points += 80
        else
            @life_points = 100
        end
        puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end
end