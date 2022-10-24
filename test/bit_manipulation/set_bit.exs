defmodule Algorithms.BitManipulation.SetBitTest do
  alias Algorithms.BitManipulation.SetBit

  use ExUnit.Case
  doctest Algorithms

  describe "Set Bit - example test cases" do
    test "Set bit number 0 in 1" do
      assert SetBit.setKthBit(1, 0) == 3
    end

    test "Set bit number 0 in 2" do
      assert SetBit.setKthBit(2, 0) == 3
    end

    test "Set bit number 1 in 10" do
      assert SetBit.setKthBit(10, 1) == 10
    end

    test "Set bit number 2 in 10" do
      assert SetBit.setKthBit(10, 2) == 14
    end
  end
end
