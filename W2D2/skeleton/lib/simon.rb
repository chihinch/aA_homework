require 'byebug'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = Array.new
  end

  def play
    until game_over
      take_turn
      system("clear")
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      sleep(1)
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    seq.each do |color|
      puts color
      sleep(1)
      system("clear")
      sleep(0.5)
    end
  end

  def require_sequence
    sequence_length.times do |idx|
      puts "Enter the next part of the sequence"
      input = gets.chomp
      return self.game_over = true if input != seq[idx]
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Excellent job, you repeated the sequence correctly!"
  end

  def game_over_message
    puts "You lose :("
    puts "You made it through #{sequence_length - 1} rounds"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = Array.new
  end
end

s = Simon.new
s.play
