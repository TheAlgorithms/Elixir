defmodule Algorithms.DataStructures.Stack do
  @moduledoc """
  Stack implementation in Elixir. A stack is like a list,
  but with only LIFO (last-in, first-out) functions. An abstract
  stack is similar to a stack of items in real life. Whatever
  goes on last must come off first.

  ## Reference: https://computersciencewiki.org/index.php/Stack
  ## Author: Ian Cowan (https://github.com/iccowan)
  """

  defstruct stack: []

  @typedoc """
  This simple stack implementation simply uses a list. Although
  elixir will allow you to have any number of different types in
  the list, it is generally good practice to only push one type
  of data per stack.
  """
  @type t :: %__MODULE__{
          stack: list()
        }

  alias Algorithms.DataStructures.Stack

  @doc """
  Pushes a given `val` to the stack

  Returns `{:ok, val, %Stack{}}`

  ## Examples

    iex> Algorithms.DataStructures.Stack.push(stack, 1)
    {:ok, 1, %Algorithms.DataStructures.Stack{stack: [1]}}

  """
  def push(stack = %Stack{stack: stack_list}, val) do
    stack = %Stack{
      stack
      | stack: [val | stack_list]
    }

    {:ok, val, stack}
  end

  @doc """
  Retrieves the value on the top of the stack without removing it

  Returns `{:ok | :error, top_val | binary(), %Stack{}}`

  ## Examples

    iex> stack = %Algorithms.DataStructures.Stack{stack: [1]}
    iex> Algorithms.DataStructures.Stack.peek(stack)
    {:ok, 1, %Algorithms.DataStructures.Stack{stack: [1]}}

    iex> stack = %Algorithms.DataStructures.Stack{}
    iex> Algorithms.DataStructures.Stack.peek(stack)
    {:error, "Empty stack", %Algorithms.DataStructures.Stack{stack: []}}

  """
  def peek(stack = %Stack{stack: []}) do
    {:error, "Empty stack", stack}
  end

  def peek(stack = %Stack{stack: [val | _stack_list]}) do
    {:ok, val, stack}
  end

  @doc """
  Retrieves the value on the top of the stack and removes it

  Returns `{:ok | :error, top_val | binary(), %Stack{}}`

  ## Examples

    iex> stack = %Algorithms.DataStructures.Stack{stack: [1]}
    iex> Algorithms.DataStructures.Stack.pop(stack)
    {:ok, 1, %Algorithms.DataStructures.Stack{stack: []}}

    iex> stack = %Algorithms.DataStructures.Stack{}
    iex> Algorithms.DataStructures.Stack.pop(stack)
    {:error, "Empty stack", %Algorithms.DataStructures.Stack{stack: []}}

  """
  def pop(stack = %Stack{stack: []}) do
    {:error, "Empty stack", stack}
  end

  def pop(stack = %Stack{stack: [val | stack_list]}) do
    stack = %Stack{
      stack
      | stack: stack_list
    }

    {:ok, val, stack}
  end

  @doc """
  Checks if a stack is empty or not

  Returns `{:ok, boolean(), %Stack{}}`

  ## Examples

    iex> stack = %Algorithms.DataStructures.Stack{stack: [1]}
    iex> Algorithms.DataStructures.Stack.is_empty(stack)
    {:ok, false, %Algorithms.DataStructures.Stack{stack: [1]}}

    iex> stack = %Algorithms.DataStructures.Stack{}
    iex> Algorithms.DataStructures.Stack.is_empty(stack)
    {:ok, true, %Algorithms.DataStructures.Stack{stack: []}}

  """
  def is_empty(stack = %Stack{stack: []}) do
    {:ok, true, stack}
  end

  def is_empty(stack = %Stack{stack: _stackList}) do
    {:ok, false, stack}
  end
end
