# frozen_string_literal: true

require_relative 'player'

# A computer player which will generate outputs.
class ComputerPlayer < Player
  def generate_code(options)
    options.shuffle.take(4)
  end

  def guess(options)
    # OPTION: add more "intelegent" guessing.
    generate_code(options)
  end
end
