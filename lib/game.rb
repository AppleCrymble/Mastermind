# frozen_string_literal: true

require_relative 'display'

# The game logic of Mastermind
class Game
  include Display

  def generate_sequence
    string = ''
    4.times do
      string += %w[r o y g b p].sample
    end
    string
  end

  def read_user_sequence
    puts sequence_prompt
    sequence = gets.chomp.downcaseSS
    return sequence if sequence.match(/[r,o,y,g,b,p]{4}/).to_s == sequence

    puts invalid_sequence_prompt
    read_user_sequence
  end
end

game = Game.new
puts game.generate_sequence
