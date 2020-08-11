require 'colorize'
require_relative "./tile.rb"
require "byebug"
class Board
        attr_reader :grid
    def initialize
        @grid = Array.new(9){Array.new(9) {Tile.new([true,true,true,false,false].sample ? 0 : 1)} }
    end

    def render
        puts "   0 1 2 3 4 5 6 7 8".blue
        @grid.each_with_index do |row, i|
            print "#{i} ".blue
            row.each_with_index do |tile, ridx|
                count = count_neighbors([i,ridx])
                if tile.revealed  && tile.value == "*"
                    print " #{count}".green
                elsif tile.flagged
                    print " F".red
                elsif tile.revealed  && tile.value == "B"
                    print " B".red
                else# count == 0
                    print " #{tile.reveal}".yellow #if @tile.value == "*"
                    
                end
            end
            puts
        end
        nil
    end

    def count_neighbors(pos)
        counter = 0
        x,y = pos
        list =  @grid[x][y].neighbors([x,y])
        list.each do |coor|
            if valid_pos?(coor)
                a,b = coor
                if @grid[a][b].value == "B"
                    counter += 1
                end
            end
        end
        return counter
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

    def toggle(pos)
        x,y = pos
        if @grid[x][y].flagged == true
            @grid[x][y].flagged = false
        else
            @grid[x][y].flagged = true
        end
    end

    def pos(array)
        x,y = array
        return "already revealed" if @grid[x][y].revealed == true
        return if valid_pos?(array) == false

        if @grid[x][y].revealed == false
            @grid[x][y].revealed = true
            if @grid[x][y].value == "B" 
                return
            end
            
            @grid[x][y].neighbors([x,y]).each do |coor|
                a,b = coor
                pos(coor) if (valid_pos?(coor) && !(@grid[a][b].value == "B"))
            end
        else
            puts "already revealed"
            return
        end
    end

    def valid_pos?(array)
        array.all? {|el| el < 9 && el >=0}
    end

    def listofneighbors

    end

    def lose?
        @grid.each do |row|
            row.each do |tile|
               #debugger
                return true if (tile.value == "B" && tile.revealed == true)
            end
        end
        return false
    end
  


end