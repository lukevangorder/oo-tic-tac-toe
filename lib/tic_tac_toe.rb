class TicTacToe
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    def initialize
        @board = Array.new(9, " ")
        @turns = 0
    end
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    def input_to_index(input)
        input = input.to_i
        input -= 1
        input
    end
    def move(index, token="X")
        @board[index]=token
    end
    def position_taken?(index)
        return @board[index] != " "
    end
    def valid_move?(index)
        if index < 9 && index >= 0
            if @board[index]==" "
                return true
            end
        end
    end
    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end
    def current_player
        if self.turn_count % 2 == 1
            return "O"
        else
            return "X"
        end
    end
    def turn
        puts "Please choose a spot"
        self.display_board
        choice = gets.chomp
        choice = self.input_to_index(choice)
        unless self.valid_move?(choice)
            puts "Please try a valid move"
            choice = gets.chomp
            choice = self.input_to_index(choice)
        else
            self.move(choice, self.current_player)
        end
    end
    def won?
        winner = false
        WIN_COMBINATIONS.each do |combination|
            if @board[combination[0]]==@board[combination[1]] &&  @board[combination[0]]==@board[combination[2]] && @board[combination[0]] != " "
                winner = true
                return combination
            end
        end
        winner
    end
    def full?
        full = true
        @board.each do |mark|
            if mark==" "
                full = false
            end
        end
        full
    end
    def draw?
        if self.full?
            if self.won? != false
                return false
            else
                return true
            end
        else
            return false
        end
    end
    def over?
        return self.draw? || self.won?
    end
    def winner
        WIN_COMBINATIONS.each do |combination|
            if @board[combination[0]]==@board[combination[1]] &&  @board[combination[0]]==@board[combination[2]] && @board[combination[0]] != " "
                return @board[combination[0]]
            end
        end
        return nil
    end
    def play
        until self.over?
            self.turn
            @turns+=1
        end
        if self.won?
            puts "Congratulations #{self.winner}!"
        elsif self.draw?
            puts "Cat's Game!"
        end
    end
end