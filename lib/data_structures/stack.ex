defmodule Stack do
  defstruct stack: []
  
  def push(stack = %Stack{stack: stack_list}, val) do
    stack =
      %Stack{
        stack |
          stack: [val | stack_list]
      }

    {:ok, val, stack}
  end

  def peek(stack = %Stack{stack: []}) do
    {:error, "Empty stack", stack}
  end

  def peek(stack = %Stack{stack: [val | _stack_list]}) do
    {:ok, val, stack}
  end

  def pop(stack = %Stack{stack: []}) do
    {:error, "Empty stack", stack}
  end

  def pop(stack = %Stack{stack: [val | stack_list]}) do
    stack = 
      %Stack{
        stack |
          stack: stack_list
      }

    {:ok, val, stack}
  end

  def isEmpty(stack = %Stack{stack: []}) do
    {:ok, true, stack}
  end

  def isEmpty(stack = %Stack{stack: _stackList}) do
    {:ok, false, stack}
  end
end
