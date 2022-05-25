require_relative 'computer_player'
require_relative 'gameboard'
require_relative 'human_player'

def start
  puts 'Mastermind!'
  puts 'play as code maker (0) or code breaker (1)'
  choice = gets.chomp.to_i

  human = HumanPlayer.new('Joe')
  computer = ComputerPlayer.new('terminator')

  board = choice == 1 ? Gameboard.new(computer, human) : Gameboard.new(human, computer)
  board.start_game
end

start
