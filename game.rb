
require_relative "./board.rb"

class Game
    def initialize
        @board = Board.new
    end

    def guess_pos
        puts "Enter 2 numbers separated by space"
        guess = gets.chomp.split(" ")
        guess.map! {|el| el.to_i}
        return guess
    end

    def play
        until @board.win? || @board.lose?
            @board.render
            pos = self.guess_pos
            @board.pos(pos)
        end

        @board.render
        return "YOU LOSE" if @board.lose?
        return "YOU WIN" if @board.win?
    end

end