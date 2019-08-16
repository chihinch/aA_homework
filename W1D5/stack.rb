class Stack
  def initialize
    @current_stack = Array.new
  end

  def push(el)
    @result << el
  end

  def pop
    @result.pop
  end

  def peek
    @current_stack.last
  end
end