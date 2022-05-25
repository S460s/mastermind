# frozen_string_literal: true

require_relative 'player'

# A computer player which will generate outputs.
class HumanPlayer < Player
  def generate_code(options); end

  def guess(options)
    p options
    puts 'Make a guess by entering 4 colors separated by spaces (" ")'

    # No check if user inputs 2 or mre same colors
    choice = gets.chomp.split
    return choice if choice.intersection(options).length == 4

    puts 'Invalid input. Please try again!'
    guess(options)
  end
end
