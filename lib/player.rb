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