defmodule AlgorithimsTest do
  use ExUnit.Case
  doctest Algorithims

  test "greets the world" do
    assert Algorithims.hello() == :world
  end
end
