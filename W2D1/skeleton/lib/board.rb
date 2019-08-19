class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    cups.each_with_index do |cup, cup_index|
      next if cup_index == 6 || cup_index == 13
      4.times {cup << :stone}
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !(0..12).include?(start_pos)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos] # Gather up the stones in the starting cup
    @cups[start_pos] = [] # Empty the starting cup

    cup_index = start_pos # Start counting indices at the starting cup

    until stones.empty? # Until the stones gathered are all distributed...
      cup_index += 1 # Advance to the next cup
      cup_index = 0 if cup_index > 13 # Reset index counter to 0 if we go past 13 
      if cup_index == 6
        @cups[6] << stones.pop if current_player_name == @name1 # Add a stone to cup 6 if we're at that cup and the current player is player 1
      elsif cup_index == 13
        @cups[13] << stones.pop if current_player_name == @name2 # Similar if we're on player 2
      else
        @cups[cup_index] << stones.pop
      end
    end

    render
    next_turn(cup_index)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt 
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    player1_stones = @cups[6].count
    player2_stones = @cups[13].count
    if player1_stones == player2_stones
      :draw
    else
      player1_stones > player2_stones ? @name1 : @name2
    end
  end
end
