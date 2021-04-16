defmodule Algorithms.Sorting.MergeSort do
  @moduledoc """
  Implementation of MergeSort algorithm (https://en.wikipedia.org/wiki/Merge_sort)

  You will be given an array of numbers, you have to sort numbers in ascending order
  using merge sort algorithm.

  Merge sort algorithm uses a divide and conquer strategy.
  It divide a list in two half. We compare the two heads of the halfs. 
  If the left one is smaller, we recursively sort with merge on tail of
  left and the all right, and we put the head left at the top.
  Else we do the same on reversed. 

  Example:
    1. [2, 1, 5, 4, 3]
    2. [2, 1, 5] [4, 3]
    3. [2] [1, 5] | [3] [4]
    4. [1, 2, 5] | [3] [4]
    5. [1, 2, 3, 4, 5]  # Recursite reunite all the small lists

   [2, 1, 5, 4, 3] => [1, 2, 3, 4, 5]

  Complexity: O(n log n)
  """
  require Integer

  @doc """
    take a List and return the List with the numbers ordered
  """
  @spec merge_sort(list(Integer)) :: list(Integer)
  def merge_sort([]), do: []
  def merge_sort([x]), do: [x]

  def merge_sort(numbers) do
    l = length(numbers)
    half = div(l, 2)
    right = merge_sort(Enum.take(numbers, half))
    left = merge_sort(Enum.drop(numbers, half))
    merge(right, left)
  end

  @spec merge(list(Integer), list(Integer)) :: list(Integer)
  defp merge(left, []), do: Enum.concat([left])
  defp merge([], right), do: Enum.concat([right])

  defp merge([h_left | t_left], [h_right | t_right]) do
    case h_left < h_right do
      true -> merge(t_left, [h_right] ++ t_right) |> concat(h_left)
      false -> Enum.concat([h_left], t_left) |> merge(t_right) |> concat(h_right)
    end
  end

  @spec concat(list(Integer), Integer) :: list(Integer)
  defp concat(list, element), do: Enum.concat([element], list)
end
