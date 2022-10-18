defmodule Algorithms.DynamicProgramming.Fibonacci do
  @moduledoc """
  Implementation of the Fibonacci sequence using Dynamic Programming / Memoization.
  """
  require Integer
  require Map

  @doc """
    Given an index i, returns the i-th Fibonacci number
  """
  @spec fibonacci(Integer) :: Integer
  def fibonacci(0), do: 0
  def fibonacci(1), do: 1

  def fibonacci(n) do
    {val, _} = memoize(n, %{0 => 0, 1 => 1})
    val
  end

  @doc """
    Given an index n and a map of known Fibonacci numbers, returns the n-th Fibonacci
    number and a map containing all i -> Fib_i pairs up to (including) n
  """
  @spec memoize(Integer, map) :: {Integer, map}
  def memoize(n, memo) do
    case Map.has_key?(memo, n) do
      true ->
        {Map.get(memo, n), memo}

      false ->
        {val2, m2} = memoize(n - 2, memo)
        {val1, m1} = memoize(n - 1, m2)
        val = val1 + val2
        memoize(n, Map.merge(m1, %{n => val}))
    end
  end
end
