defmodule Algorithms.Sorting.SelectionSort do
  @moduledoc """
  Implementation of SelectionSort algorithm (https://en.wikipedia.org/wiki/Selection_sort)

  You will be given an array of numbers, you have to sort numbers in ascending order
  using selection sort algorithm.

  The algorithm divides the input list into two parts:
    - A sorted sublist of items which is built up from left to right at the front (left) of the list
    - A sublist of the remaining unsorted items that occupy the rest of the list
  Initially, the sorted sublist is empty and the unsorted sublist is the entire input list.
  The algorithm proceeds by finding the smallest (or largest, depending on sorting order)
  element in the unsorted sublist, exchanging (swapping) it with the leftmost unsorted
  element (putting it in sorted order), and moving the sublist boundaries one element to the right.

  Example:
    Input: [11, 25, 12, 22, 64]

    | Sorted sublist 	    | Unsorted sublist 	    | Least element in unsorted list
    | [] 	                | [11, 25, 12, 22, 64] 	| 11
    | [11] 	              | [25, 12, 22, 64] 	    | 12
    | [11, 12] 	          | [25, 22, 64] 	        | 22
    | [11, 12, 22] 	      | [25, 64] 	            | 25
    | [11, 12, 22, 25] 	  | [64] 	                | 64
    | [11, 12, 22, 25, 64]| []                    |

   Complexity: O(n^2)
  """
  require Integer

  @doc """
    take a List and return the List with the numbers ordered
  """
  @spec selection_sort(list(Integer)) :: list(Integer)
  def selection_sort(list) do
    do_selection(list, [])
  end

  def do_selection([head | []], acc) do
    acc ++ [head]
  end

  def do_selection(list, acc) do
    min = min(list)
    do_selection(:lists.delete(min, list), acc ++ [min])
  end

  defp min([first | [second | []]]) do
    smaller(first, second)
  end

  defp min([first | [second | tail]]) do
    min([smaller(first, second) | tail])
  end

  defp smaller(e1, e2) do
    if e1 <= e2 do
      e1
    else
      e2
    end
  end
end
