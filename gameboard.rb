# frozen_string_literal: true

# class to represent the gameboard for mastermind
class Gameboard
  OPTIONS = %w[red blue yellow green purple orange].freeze
  TURNS = 12

  def initialize(code_maker, code_breaker)
    @turns_played = 0
    @code_maker = code_maker
    @code_breaker = code_breaker

    @secret_code = []
    @feedback = []
  end

  def start_game
    init_code

    loop do
      make_guess
      p @feedback
      break if gameover?
    end

    handle_end
  end

  private

  def handle_end
    puts 'GG'
    if code_broken?
      puts "Congrts, #{@code_breaker} won in #{@turns_played} turns!"
    else
      puts "Congrats, #{@code_maker} won!"
    end
    play_again
  end

  def play_again
    puts 'Play again? (y/n)'
    ans = gets.chomp

    if ans == 'y'
      puts 'Switching code maker and breaker!'
      reset_game
    else
      puts 'Thanks for playing!'
    end
  end

  def reset_game
    @code_breaker, @code_maker = @code_maker, @code_breaker
    @turns_played = 0
    start_game
  end

  def init_code
    @secret_code = @code_maker.generate_code(OPTIONS)
  end

  def code_broken?
    @feedback.all?('black') && @feedback.length == @secret_code.length
  end

  def gameover?
    code_broken? || @turns_played == TURNS
  end

  def make_guess
    @turns_played += 1
    @feedback = @code_breaker.guess(OPTIONS).map.with_index do |value, index|
      if @secret_code.include?(value)
        @secret_code[index] == value ? 'black' : 'white'
      end
    end
    @feedback.shuffle!.compact!
  end
end
