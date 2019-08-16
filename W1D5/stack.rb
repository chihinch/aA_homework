class Stack
  def initialize
    @current_stack = Array.new
  end

  def push(el)
    @current_stack << el
    self
  end

  def pop
    @current_stack.pop
  end

  def peek
    @current_stack.last
  end
end