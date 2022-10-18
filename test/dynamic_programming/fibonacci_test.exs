defmodule Algorithms.DynamicProgramming.FibonacciTest do
  alias Algorithms.DynamicProgramming.Fibonacci

  use ExUnit.Case

  describe "fibonacci/1 - example test cases" do
    test "fib 1" do
      assert Fibonacci.fibonacci(1) == 1
    end

    test "fib 2" do
      assert Fibonacci.fibonacci(2) == 1
    end

    test "fib 3" do
      assert Fibonacci.fibonacci(3) == 2
    end

    test "fib 5" do
      assert Fibonacci.fibonacci(5) == 5
    end

    test "fib 10" do
      assert Fibonacci.fibonacci(10) == 55
    end
  end
end
