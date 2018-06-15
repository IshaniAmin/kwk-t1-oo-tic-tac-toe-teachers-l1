
class TicTacToe

  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


def input_to_index(number)
  number = number.to_i
  index = number - 1
  return index
end


def move(index, counter = "X")
  @board[index]=counter
end


def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end


def valid_move?(index)
  if position_taken?(index) == false && index.between?(0,8)
    true
  else
    false
  end
end


def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index=input_to_index(input)
  if valid_move?(index) == true
    move(index, current_player)
    display_board
  else
    turn
  end
end


def turn_count
  count =0
  @board.each do |move|
    if move == "X" || move == "O"
      count += 1
    end
  end
return count
end


def current_player
  count=turn_count
  if count % 2 == 0
    return "X"
  else
    return "O"
  end
end


def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    p_1 = @board[win_index_1]
    p_2 = @board[win_index_2]
    p_3 = @board[win_index_3]
    if p_1 == "X" && p_2 == "X" && p_3 == "X"
      return win_combination
      winner = "X"
    elsif p_1 == "O" && p_2 == "O" && p_3 == "O"
      return win_combination
      winner = "O"
    else
      win_combination=0
    end
  end
  if win_combination=0
    return false
  end
end


def full?
  if @board.include? " "
    return false
  else
    return true
  end
end


def draw?
  if won?
    return false
  else full?
    return true
  end
end


def over?
  if won?
    return true
  elsif full?
    return true
  else
    return false
  end
end


def winner
  if won?
    win_combination = won?
    windex = win_combination[0]
    if @board[windex] == "X"
      return "X"
    else
      return "O"
    end
  end
end


def play
  puts "Welcome to Tic Tac Toe!"
  while !over?
    #turn_count = turn_count
    #value = current_player
    turn
  end
  if won?
    #win=winner
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
