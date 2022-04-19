# CODEWARS: https://www.codewars.com/kata/578aa45ee9fd15ff4600090d/elixir

# You will be given an array of numbers.
# You have to sort the odd numbers in ascending order
# while leaving the even numbers at their original positions.

# EXAPLES:
# [7, 1]                            =>  [1, 7]
# [5, 8, 6, 3, 4]                   =>  [3, 8, 6, 5, 4]
# [1, 2, 3, -1, -3, 5]              =>  [-3, 2, -1, 1, 3, 5]
# [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]    =>  [1, 8, 3, 6, 5, 4, 7, 2, 9, 0]

defmodule Algorithms.CodeWars.SortTheOdd do
  @moduledoc """
  line 31: Theta(n)
  line 32: BigO(n log n)
  line 33: Theta(n + m) - where n: input List length, m: number of odd in input List
  line 34: BigO(1) - note: only for List
  -----------------------------
  Complexity: BigO(n log n)
  """
  require Integer

  @doc """
  take a List and return the list with only odd numbers ordered
  """
  @spec sort_the_odd(list(integer)) :: list(integer)

  def sort_the_odd(input_list) do
    input_list
    |> Enum.filter(&Integer.is_odd/1)
    |> Enum.sort()
    |> merge(input_list, [])
    |> Enum.reverse()
  end

  @doc """
  recursive function: take sorted odd List, input List, result
  return the merged list with the even number fixed at the same index
  """
  @spec merge(list(integer), list(integer), list(integer)) :: list(integer)

  def merge([], input_list, result), do: Enum.reverse(input_list) |> Enum.concat(result)
  def merge(sorted_list, [], result), do: Enum.concat(sorted_list, result)

  def merge([sorted_head | sorted_rest], [head | rest], result) do
    # i go on until i find an odd number
    case Integer.is_odd(head) do
      true -> merge(sorted_rest, rest, [sorted_head | result])
      false -> merge([sorted_head | sorted_rest], rest, [head | result])
    end
  end
end
