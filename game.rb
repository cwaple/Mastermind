class Game
  def initialize(board, turns)
    @board = board
    @turns = turns
    @turn = 0
    @guess_board = (1..@board.get_num_of_slots).to_a
    @solutions_array_display
  end

  def what_turn?
    @turn
  end

  def get_board
    @board.inspect
  end

  def guess_board(guess)
    @guess_board = guess
    @solutions_array_display = check_solution
    @turn += 1
  end

  def game_over?
    return true unless @turn < @turns
    return true if @board.get_board == @guess_board
    false
  end

  def check_solution
    real_board_one_count = @board.get_board.count(1)
    real_board_two_count = @board.get_board.count(2)
    guess_board_one_count = @guess_board.count(1)
    guess_board_two_count = @guess_board.count(2)

    new_sol_size = 0 
    new_sol_size += real_board_one_count if real_board_one_count == guess_board_one_count
    new_sol_size += real_board_two_count if real_board_two_count == guess_board_two_count
    new_sol_size += real_board_one_count if guess_board_one_count > real_board_one_count
    new_sol_size += real_board_two_count if guess_board_two_count > real_board_two_count
    new_sol_size += guess_board_one_count if real_board_one_count > guess_board_one_count
    new_sol_size += guess_board_two_count if real_board_two_count > guess_board_two_count

    solutions_array = (1..new_sol_size).to_a
    counter = 0
    for x in 0..@board.get_num_of_slots-1
      if @guess_board[x] == @board.get_board[x]
        solutions_array[counter] = 'B'
        counter += 1
      end 
    end

    for x in counter..@board.get_num_of_slots-1
      solutions_array[x] = 'W'
    end

    solutions_array
  end

  def display_round
    print "Turn #{@turn}: #{@guess_board.inspect} #{@solutions_array_display.inspect}"
  end

end