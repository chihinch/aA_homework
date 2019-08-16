class Queue

    def initialize
        @current_queue = Array.new
    end

    def enqueue(el)
        # Front of queue is last element
        @current_queue.unshift(el)
        self
    end

    def dequeue
        # Remove from front of queue (i.e. last element of array)
        @current_queue.pop
    end

    def peek
        # Want to see the first person in the queue
        @current_queue.last
    end

end