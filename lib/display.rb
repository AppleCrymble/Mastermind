# frozen_string_literal: true

# Display prompts for the game
module Display
  def sequence_prompt
    'Enter a 6-long sequence of colours (r/o/y/g/b/p): '
  end

  def invalid_sequence_prompt
    'Invalid sequence.'
  end
end
