# frozen_string_literal: true

# A sequence in the game Mastermind
class Sequence
  PEGS = {
    'r' => "\e[38;5;9m\u2B24\e[0m",
    'o' => "\e[38;5;215m\u2B24\e[0m",
    'y' => "\e[38;5;228m\u2B24\e[0m",
    'g' => "\e[38;5;10m\u2B24\e[0m",
    'b' => "\e[38;5;12m\u2B24\e[0m",
    'p' => "\e[38;5;13m\u2B24\e[0m"
  }.freeze

  def initialize(sequence)
    @sequence = sequence
  end

  def to_s
    string = ''
    @sequence.split('').each do |peg|
      string += PEGS[peg]
    end
    string
  end
end

sq = Sequence.new('roygbp')
puts sq