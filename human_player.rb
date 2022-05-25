# frozen_string_literal: true

require_relative 'player'

# A computer player which will generate outputs.
class HumanPlayer < Player
  def generate_code(options)
    puts "Choose 4 of these colors to make the secret code (can't repeat colors)"
    code_input(options)
  end

  def guess(options)
    puts 'Make a guess by entering 4 colors separated by spaces (" ")'
    code_input(options)
  end

  private

  def code_input(options)
    p options
    code = gets.chomp.split
    return code if code.intersection(options).length == 4

    puts 'Invalid input. Please try again!'

    code_input(options)
  end
end
