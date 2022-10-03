defmodule Algorithms.CodeWars.SortTheOddTest do
  alias Algorithms.CodeWars.SortTheOdd

  use ExUnit.Case

  describe "sort_the_odd/1 - example test cases" do
    test "example 1" do
      assert SortTheOdd.sort_the_odd([7, 1]) === [1, 7]
    end

    test "example 2" do
      assert SortTheOdd.sort_the_odd([5, 8, 6, 3, 4]) === [3, 8, 6, 5, 4]
    end

    test "example 3" do
      assert SortTheOdd.sort_the_odd([1, 2, 3, -1, -3, 5]) === [-3, 2, -1, 1, 3, 5]
    end

    test "example 4" do
      assert SortTheOdd.sort_the_odd([9, 8, 7, 6, 5, 4, 3, 2, 1, 0]) === [
               1,
               8,
               3,
               6,
               5,
               4,
               7,
               2,
               9,
               0
             ]
    end
  end

  describe "sort_the_odd/1 - additional test cases" do
    test "it works when the list is empty" do
      assert SortTheOdd.sort_the_odd([]) === []
    end

    test "it works with only positive odd numbers" do
      assert SortTheOdd.sort_the_odd([3, 1, 5, 9, 7]) === [1, 3, 5, 7, 9]
    end

    test "it works with only odd numbers" do
      assert SortTheOdd.sort_the_odd([3, -1, 5, -7, 11]) === [-7, -1, 3, 5, 11]
    end

    test "it works with only positive numbers" do
      assert SortTheOdd.sort_the_odd([3, 2, 4, 1, 7, 8, 0, 1]) === [1, 2, 4, 1, 3, 8, 0, 7]
    end

    test "it works without restrictions" do
      assert SortTheOdd.sort_the_odd([3, -1, -4, 5, -1, 8, 6]) === [-1, -1, -4, 3, 5, 8, 6]
    end
  end
end
