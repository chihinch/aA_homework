class Player
  attr_reader :name, :side

  def initialize(name, side)
    @name = name
    @side = side
  end

  def prompt
    puts "#{@name}, please enter which cup you would like to start from: "
    start_pos = gets.chomp.to_i
    if (start_pos.between?(1,6) && @side != 1 || # If player is side 1 and doesn't enter 1 to 6
        start_pos.between?(7,12) && @side != 2) # Or if player is side 2 and doesn't enter 7 to 12
      raise "Not your side!" # Let player know they entered an invalid start_pos
    else
      start_pos
    end
  end
end
