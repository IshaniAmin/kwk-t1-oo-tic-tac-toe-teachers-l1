class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i - 1
    return index
  end
  
  def move(index, character="X")
    @board[index] = character
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0,8) && position_taken?(index) == false
  end
  
  def turn
    character = current_player
    puts "Please enter 1-9:"
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
      move(index, character)
    else 
      until valid_move?(index)
        puts "Please enter 1-9:"
        input = gets
        index = input_to_index(input)
      end
      move(index, character)
    end
    display_board
  end

  def turn_count
    count = 0 
    @board.each do |spot|
      if spot != " "
        count += 1 
      end
    end
    return count
  end
  
  def current_player
    if turn_count % 2 == 0 
      return "X"
    else 
      return "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" 
        return combo 
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O" 
        return combo  
      end
    end 
    return false
  end

  def full?
    @board.each do |spot|
      if spot == " "
        return false 
      end
    end
    return true 
  end

  def draw?
    if full? && !won?
      return true 
    else
      return false 
    end
  end
  
  def over?
    if won? || draw? || full?
      return true 
    else 
      return false
    end
  end
  
  def winner
    winning_combo = won?
    if winning_combo != false
      return @board[winning_combo[0]]
    else 
      return nil 
    end
  end
  
  def play
    while !over?
      turn
    end
    if won?
      win = winner
      puts "Congratulations #{win}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end