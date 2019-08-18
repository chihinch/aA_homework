class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
    end
  end

  def place_stones
    cups.each_with_index do |cup, cup_index|
      4.times {cup << :stone} unless cup_index == 6 || cup_index == 13
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !(0..13).include?(start_pos)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    num_stones_in_start_cup = @cups[start_pos].length # Count how many stones there were in the selected cup
    @cups[start_pos].clear # Empty the selected cup

    cup_index = start_pos

    until num_stones_in_start_cup == 0
      cup_index += 1 # Advance to the next cup
      if cup_index == 6 && current_player_name == @player1
        cup_index = 7 # Skip cup 6 if side 1 is playing
      elsif (cup_index == 12 && current_player_name == @player2) || cup_index > 13
        cup_index = 0 # Skip cup 13 if side 2 is playing, or reset to cup 0 if the cup_index goes out of bounds
      end
      @cups[cup_index] << :stone # Add a stone to the current cup
      num_stones_in_start_cup -= 1
    end

    render
    next_turn(cup_index)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :switch if @cups[ending_cup_idx].length - 1 == 0
    return :prompt if ending_cup_idx = nil
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
    return :draw if @cups[6].length == @cups[13].length
    @cups[6].length > @cups[13].length ? @player1 : @player2
  end
end
