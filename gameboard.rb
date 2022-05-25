# frozen_string_literal: true

# class to represent the gameboard for mastermind
class Gameboard
  OPTIONS = %w[red blue yellow green purple orange].freeze
  TURNS = 12

  def initialize
    @turns_played = 0
    @secret_code = []
    @feedback = []
    @board = []
  end

  def init_code(player)
    @secret_code = player.generate_code(OPTIONS)
  end
end
