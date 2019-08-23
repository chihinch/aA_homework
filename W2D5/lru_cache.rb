require 'byebug'

class LRUCache
    def initialize(size)
        @cache = Array.new
        @size = size
    end

    def count
        # returns number of elements currently in cache
        cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle

        if cache.include?(el)
            # debugger
            # If the cache already contains the element...
            # Delete the existing element and add the new one to the back
            cache.delete(el)
            cache << el

        elsif count >= size
            # Is this where the flaw is? Because the first element is not necessarily the LRU?
            # debugger
            # If the cache's size is at its limit...
            # Take off the first element and add the element to the back
            # (presumably the first element is the LRU?)
            cache.shift(1)
            cache << el
        else
            # debugger
            # If neither of these apply, just add the element
            cache << el
        end

    end

    def show
      # shows the items in the cache, with the LRU item first
      p cache
    end

    private
    # helper methods go here!
    attr_accessor :cache
    attr_reader :size

  end

  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})

  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]