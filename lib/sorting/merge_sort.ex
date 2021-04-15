# Sorting: https://en.wikipedia.org/wiki/Merge_sort
#
# You will be given an array of numbers, you have to sort numbers in ascending order
# using merge algorithm.
#
# Examples:
#  [2, 1, 5, 4, 3]                 => [1, 2, 3, 4, 5]
#  [1, 8, 3, 6, 5, 4, 7, 2, 9, 0]  => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
#  [12, 34, 23, 44, 1, 10, 18, 85] => [1, 10, 12, 18, 23, 34, 44, 85]

defmodule Algorithms.Sorting.MergeSort do
  @moduledoc """

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


