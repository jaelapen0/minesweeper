
require_relative "./tile.rb"

class Board

    def initialize
        @grid = Array.new(9){Array.new(9) {Tile.new([true,true,false].sample ? 0 : 1)} }
    end

    def render
        puts "   0 1 2 3 4 5 6 7 8"
        @grid.each_with_index do |row, i|
            print "#{i} "
            row.each do |tile|
                print " #{tile.reveal}"
            end
            puts
        end
        nil
    end

    def win?
        @grid.each do |row|
            row.each do |tile|
                if tile.value == "*" && tile.revealed == false
                    return false
                end
            end
        end
        return true
    end

    def pos(array)
        x,y = array
     #   return if @grid[x.]
        if @grid[x][y].revealed == false
            @grid[x][y].revealed = true
        else
            raise "this tile is already revealed"
        end
    end

    def valid_pos?(array)
        array.all? {|el| el < 9 & el >=0}
    end

    def lose?
        @grid.each do |row|
            row.each do |tile|
                return true if tile.value == "B" && tile.revealed == true
            end
        end
        return false
    end
  


end