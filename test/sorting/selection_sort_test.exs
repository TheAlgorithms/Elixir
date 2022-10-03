defmodule Algorithms.Sorting.SelectionSortTest do
  alias Algorithms.Sorting.SelectionSort

  use ExUnit.Case

  describe "select_sort/1 - Test cases" do
    test "test 1" do
      inp = [7, 1]
      outp = [1, 7]
      assert SelectionSort.selection_sort(inp) === outp
    end

    test "test 2" do
      inp = [2, 1, 5, 4, 3]
      outp = [1, 2, 3, 4, 5]
      assert SelectionSort.selection_sort(inp) === outp
    end

    test "test 3" do
      inp = [1, 8, 3, 6, 5, 4, 7, 2, 9, 0]
      outp = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

      assert SelectionSort.selection_sort(inp) === outp
    end

    test "test 4" do
      inp = [12, 34, 23, 44, 1, 10, 18, 85]
      outp = [1, 10, 12, 18, 23, 34, 44, 85]

      assert SelectionSort.selection_sort(inp) === outp
    end
  end
end
