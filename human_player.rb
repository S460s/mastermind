# frozen_string_literal: true

require_relative 'player'

# A computer player which will generate outputs.
class HumanPlayer < Player
  def generate_code(options); end

  def guess(options)
    p options
    puts 'Make a guess by entering 4 colors separated by spaces (" ")'

    # add logic to validate input
    gets.chomp.split
  end
end
