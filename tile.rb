class Tile
    attr_reader   :value
    attr_accessor :revealed , :flagged
    def initialize(value)
        @value = value == 1 ? "B" : "*"
        @revealed = false
        @flagged = false
    end

    def value
        @value
    end

    def reveal#(pos)
        if @revealed
            return @value
        else
            return  "?"
        end
    end

    def neighbors(pos)
        list = []
        x,y = pos
        list.push( [x-1,y], [x+1,y], [x,y-1], [x,y+1])
        return list        
    end

    def neighbors_bomb_count(pos)
        list = neighbors(pos)
    end

end