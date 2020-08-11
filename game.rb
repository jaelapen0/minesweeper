
require_relative "./board.rb"
require 'yaml'

class Game
    def initialize
        @board = Board.new
    end

    def take_input
        inputs = []
        puts "Enter flag or guess"
        inputs << gets.chomp
        inputs << guess_pos
        x,y = inputs[1]
        if inputs[0] == "flag"
            @board.toggle(inputs[1])
        else
            @board.pos(inputs[1])
        end
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
            self.take_input
        end

        @board.render
        return "YOU LOSE" if @board.lose?
        return "YOU WIN" if @board.win?
    end

    def save 
         saved = self.to_yaml
         File.open("saved.yml", "w") { |file| file.write(saved) }
    end

    def load 
        YAML.load(File.read("saved.yml"))
    end 
end