class Map

    def initialize
        @current_map = Array.new
    end

    def set(key, value)
        @current_map.each_with_index do |pair, idx|
            @current_map[idx] = [key, value] if pair.first == key
        end
        @current_map << [key, value] if @current_map.none? {|pair| pair.first == key}
        self
    end

    def get(key)
        find_pair_w_key(key).first
    end

    def delete(key)
        @current_map.delete(find_pair_w_key(key))
    end

    def find_pair_w_key(key)
        @current_map.bsearch { |pair| pair.first == key }
    end

    def show
        @current_map
    end

end
