defmodule Algorithms.Sorting.MergeSortTest do
  alias Algorithms.Sorting.MergeSort

  use ExUnit.Case

  describe "merge_sort/1 - example test cases" do
    test "example 1" do
      assert MergeSort.merge_sort([7, 1]) === [1, 7]
    end

    test "example 2" do
      assert MergeSort.merge_sort([2, 1, 5, 4, 3]) === [1, 2, 3, 4, 5]
    end

    test "example 3" do
      assert MergeSort.merge_sort([1, 8, 3, 6, 5, 4, 7, 2, 9, 0]) === [
               0,
               1,
               2,
               3,
               4,
               5,
               6,
               7,
               8,
               9
             ]
    end

    test "example 4" do
      assert MergeSort.merge_sort([12, 34, 23, 44, 1, 10, 18, 85]) === [
               1,
               10,
               12,
               18,
               23,
               34,
               44,
               85
             ]
    end
  end
end
