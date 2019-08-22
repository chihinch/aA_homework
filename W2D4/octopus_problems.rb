# Hungry Octopus

# O(n^2) 
def sluggish_octopus(fish)
    # Essentially assuming the current_fish is the longest
    # And its comparison fish is even longer
    # Return the current_fish if it's longer than the comparison
    fish.each_with_index do |fish_i, idx| # Assume fish_i is the longest
        longest = true
        fish.each_with_index do |fish_j, jdx|
            next if idx == jdx
            longest = false if fish_j.length > fish_i.length # But if fish_j is longer, then we flip the flag back to false
        end
        return fish_1 if longest
    end

end

# O(n log n)
def dominant_octopus(fish)
    prc = Proc.new { |a, b| b.length <=> a.length }
    fish.merge_sort(&prc).first
end

class Array
    def merge_sort(&prc)
        prc ||= Proc.new { |a, b| b <=> a }
        return self if self.length <= 1

        mid_idx = self.length / 2
        Array.merge(
        self.take(mid_idx).merge_sort(&prc),
        self.drop(mid_idx).merge_sort(&prc),
        &prc
        )
    end

    def self.merge(left, right, &prc)
        merged_array = []
        until left.empty? || right.empty?
        case prc.call(left.first, right.first)
        when -1
            merged_array << left.shift
        when 0
            merged_array << left.shift
        when 1
            merged_array << right.shift
        end
        end

        merged_array + left + right
    end
end

# O(n)
def clever_octopus(fish)
    longest_fish = fish.first
    fish_arr.each do |the_fish|
        longest_fish = the_fish if the_fish.length > longest_fish.length
    end
    longest_fish
end

# Dancing Octopus

# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# O(n)
def slow_dance(tile, tiles_array)
    tiles_array.each_with_index do |direction, idx|
        return idx if direction == tile
    end
end

# O(1)
def constant_dance(tile, tiles_hash)
    tiles_hash[tile]
end
