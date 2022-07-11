# frozen_string_literal: true

# Display prompts for the game
module Display
  def sequence_prompt
    'Enter a 4-long sequence of colours (r/o/y/g/b/p): '
  end

  def invalid_sequence_prompt
    'Invalid sequence.'
  end

  def player_won_message
    'Congratulations! You won!'
  end

  def player_lost_message(solution)
    "Commiserations.\nThe answer was #{solution}"
  end
end
