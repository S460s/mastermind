# frozen_string_literal: true

# class to represent the gameboard for mastermind
class Gameboard
  OPTIONS = %w[red blue yellow green purple orange].freeze
  TURNS = 12

  def initialize(code_maker, code_breaker)
    @turns_played = 0
    @code_maker = code_maker
    @code_breaker = code_breaker

    @used_indexes = []
    @secret_code = []
    @feedback = []
    @board = []
  end

  def start_game
    init_code
    loop do
      make_guess
      break if gameover?
      end
    end
    handle_end
  end

  private
  def init_code
    @secret_code = @code_maker.generate_code(OPTIONS)
    p @secret_code
  end

  def code_broken?
    @feedback.all?('black') && @feedback.length == @secret_code.length
  end

  def gameover?
    code_broken? || @turns_played == TURNS
  end

  def make_guess
    @feedback = @code_breaker.guess(OPTIONS).map.with_index do |value, index|
      if @secret_code.include?(value)
        @secret_code[index] == value ? 'black' : 'white'
      end
    end
    @feedback.shuffle!.compact!
  end
end
 