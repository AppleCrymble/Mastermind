# frozen_string_literal: true

require_relative 'display'

# The game logic of Mastermind
class Game
  include Display

  def read_user_sequence
    puts sequence_prompt
    sequence = gets.chomp.downcase
    return sequence if sequence.match(/[r,o,y,g,b,p]{6}/).to_s == sequence

    puts invalid_sequence_prompt
    read_user_sequence
  end
end

game = Game.new
puts game.read_user_sequence
