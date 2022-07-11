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
    guess_pegs = guess.sequence.split('')
    p available_pegs
    clue += handle_exact_matches(@sequence, guess, guess_pegs, available_pegs)
    p available_pegs
    clue += handle_partial_matches(guess_pegs, available_pegs)
    p available_pegs
    clue += INCORRECT until clue.count("\u25CF") == 4
    clue
  end

  private

  def handle_exact_matches(answer, guess, guess_pegs, available_pegs)
    partial_clue = ''
    guess.sequence.split('').each_with_index do |peg, index|
      next unless answer[index] == peg

      partial_clue += CORRECT
      available_pegs.delete_at(available_pegs.index(peg))
      guess_pegs.delete_at(guess_pegs.index(peg))
      peg
    end
    partial_clue
  end

  def handle_partial_matches(guess_pegs, available_pegs)
    partial_clue = ''
    guess_pegs.each do |peg|
      next unless available_pegs.include? peg

      partial_clue += MISPLACED
      available_pegs.delete_at(available_pegs.index(peg))
    end
    partial_clue
  end
end
