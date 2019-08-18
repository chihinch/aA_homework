require_relative 'board'
require_relative 'player'

class Mancala
  def initialize(name1, name2)
    @player1 = Player.new(name1, 1) # Create a player instance who takes side 1
    @player2 = Player.new(name2, 2) # Create a player instance who takes side 2
    @board = Board.new(name1, name2) # Create a new board with both players
  end

  def play
    puts "Welcome to Mancala"
    @board.render
    current_player = @player1
    until won?
      take_turn(current_player) # Player takes their turn (and continues until move_result is :switch)
      current_player = current_player == @player1 ? @player2 : @player1
    end

    puts "The game is finished! #{winner_message}" # Prints out winner message once until loop ends
  end

  def take_turn(current_player)
    move_result = :prompt

    until move_result == :switch
      if move_result == :prompt
        print_indices # Prints the board indices

        begin
          start_pos = current_player.prompt # Prompts player for move
          start_pos -= 1 if start_pos <= 6 # Account for zero indexing?
          @board.valid_move?(start_pos)
        rescue Exception => e
          puts e.message
        retry
        end
        move_result = @board.make_move(start_pos, current_player.name) # Make current move from start_pos
      else
        move_result = @board.make_move(move_result, current_player.name) # Make move from the previous result
      end
      break if won?
    end
  end

  def won?
     @board.one_side_empty?
  end

  def winner_message
    winner = @board.winner
    if winner == :draw
      "It was a draw!"
    else
      "Congrats, #{winner}!"
    end
  end

  def print_indices
    puts "\nCup indices:"
    puts "12  11  10   9   8   7"
    puts " 1   2   3   4   5   6"
  end
end
