# frozen_string_literal: true

require_relative 'display'
require_relative 'sequence'

# The game logic of Mastermind
class Game
  include Display

  WIN_CONDITION = "\e[38;5;10m\u25CF\e[0m\e[38;5;10m\u25CF\e[0m\e[38;5;10m\u25CF\e[0m\e[38;5;10m\u25CF\e[0m"

  def initialize
    player_guess_game
  end

  def player_guess_game
    @solution = generate_sequence
    puts player_guess_loop
  end

  def player_guess_loop
    guess_history = ''
    10.times do |index|
      guess = read_user_sequence
      clue = @solution.compare_to(guess)
      puts guess_history += "#{guess}  #{clue}#{"\n" unless index == 10}"
      return player_won_message if clue == WIN_CONDITION
    end
    player_lost_message(@solution)
  end

  def generate_sequence
    string = ''
    4.times do
      string += %w[r o y g b p].sample
    end
    Sequence.new(string)
  end

  def read_user_sequence
    puts sequence_prompt
    sequence = gets.chomp.downcase
    return Sequence.new(sequence) if sequence.match(/[r,o,y,g,b,p]{4}/).to_s == sequence

    puts invalid_sequence_prompt
    read_user_sequence
  end

  def computer_guess_loop

  end

  def read_user_clue(guess)
    puts clue_prompt(guess)
    clue = gets.chomp.downcase
    return clue if clue.match(/[c,m]{0,4}/)

    puts invalid_clue_prompt
    read_user_clue
  end
end
