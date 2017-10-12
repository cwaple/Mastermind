require "./board"
require "./game"

puts "Welcome to Mastermind"
puts "For current functionality, the game will be played with two colors."
puts "Please enter your name: "
player_name = gets.strip

# create board, then game
game_board = Board.new(4,2)
game = Game.new(game_board, 12)
# while !game.game_over?
    # ask player for set of guesses
    # if guess correct
        # game over congratz!
        # break
    # display feedback
    # game.turns += 1
# end
while !game.game_over?
    guess = (1..game_board.get_num_of_slots).to_a
    for x in 1..game_board.get_num_of_slots
        print "Enter guess #{x}: "
        guess[x-1] = gets.strip.to_i
    end
    game.guess_board(guess)
    game.display_round
    puts "\n"
end