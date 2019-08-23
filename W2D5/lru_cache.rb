class LRUCache
    def initialize(size)
        @cache = Array.new(size, nil)
        @last_item_added = nil
        @lru = nil
    end

    def count
        # returns number of elements currently in cache
        cache.count { |x| !x.nil? }
    end

    def add(el)
      # adds element to cache according to LRU principle
        cache.each do |ele|
            if ele.nil?
                ele = el
                break
            end
        end
        
        if cache.all? { |ele| ele.nil? }
            if lru.nil?
                cache[0] = el
                lru = cache[1]
            end
        end

        #cache.push(el) unless cache.none? { |ele| ele.nil? }
    end

    def show
      # shows the items in the cache, with the LRU item first
    end

    private
    # helper methods go here!
    attr_accessor :cache, :last_item_added, :lru

  end