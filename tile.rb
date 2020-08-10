class Tile
    attr_reader :value
    attr_accessor :revealed
    def initialize(value)
        @value = value == 1 ? "B" : "*"
        @revealed = false
    end

    def reveal
        if @revealed
            #if @value == 
            return @value
        else
            return  "?"
        end
    end

    def neighbors
        
    end

    def neighbors_bomb_count

    end

end