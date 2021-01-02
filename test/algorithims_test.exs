defmodule AlgorithmsTest do
  use ExUnit.Case
  doctest Algorithms

  test "greets the world" do
    assert Algorithms.hello() == :world
  end
end
