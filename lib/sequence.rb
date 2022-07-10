# frozen_string_literal: true

# A sequence in the game Mastermind
class Sequence
  CODE_PEGS = {
    'r' => "\e[38;5;9m\u2B24\e[0m ",
    'o' => "\e[38;5;215m\u2B24\e[0m ",
    'y' => "\e[38;5;228m\u2B24\e[0m ",
    'g' => "\e[38;5;10m\u2B24\e[0m ",
    'b' => "\e[38;5;12m\u2B24\e[0m ",
    'p' => "\e[38;5;13m\u2B24\e[0m "
  }.freeze
  CORRECT = "\e[38;5;10m\u25CF\e[0m"
  MISPLACED = "\e[38;5;228m\u25CF\e[0m"
  INCORRECT = "\e[38;5;9m\u25CF\e[0m"

  attr_reader :sequence

  def initialize(sequence)
    @sequence = sequence
  end

  def to_s
    string = ''
    @sequence.split('').each do |peg|
      string += CODE_PEGS[peg]
    end
    string
  end

  def compare_to(guess)
    clue = ''
    available_pegs = @sequence.split('')
    clue += handle_exact_matches(@sequence, guess, available_pegs)
    clue += handle_partial_matches(guess, available_pegs)
    clue += INCORRECT until clue.count("\u25CF") == 4
    guess.to_s + clue
  end

  private

  def handle_exact_matches(answer, guess, available_pegs)
    partial_clue = ''
    guess.sequence.split('').each_with_index do |peg, index|
      next unless answer[index] == peg

      partial_clue += CORRECT
      available_pegs.delete_at(available_pegs.index(peg))
    end
    partial_clue
  end

  def handle_partial_matches(guess, available_pegs)
    partial_clue = ''
    guess.sequence.split('').each do |peg|
      next unless available_pegs.include? peg

      partial_clue += MISPLACED
      available_pegs.delete_at(available_pegs.index(peg))
    end
    partial_clue
  end
end

a = Sequence.new("ppoo")
b = Sequence.new("ooop")
puts a.compare_to(b)
