# Sorting: https://en.wikipedia.org/wiki/Merge_sort
#
# You will be given an array of numbers, you have to sort numbers in ascending order
# using quick sort algorithm.
#
# Examples:
#  [2, 1, 5, 4, 3]                 => [1, 2, 3, 4, 5]
#  [1, 8, 3, 6, 5, 4, 7, 2, 9, 0]  => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
#  [12, 34, 23, 44, 1, 10, 18, 85] => [1, 10, 12, 18, 23, 34, 44, 85]

defmodule Algorithms.Sorting.QuickSort do
  @moduledoc """

  """
  require Integer

  @doc """
    take a List and return the List with the numbers ordered
  """
  @spec quick_sort(list(Integer)) :: list(Integer)
  def quick_sort([]), do: []
  def quick_sort([head | tail]) do
    small = Enum.filter(tail, fn x -> x <= head end) |> quick_sort()
    bigger = Enum.filter(tail, fn x -> x > head end) |> quick_sort()

    Enum.concat(small, [head]) |> Enum.concat(bigger)
  end

end



