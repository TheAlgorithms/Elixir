defmodule Algorithms.Sorting.QuickSort do
  @moduledoc """
  Implementation of QuickSort algorithm (https://en.wikipedia.org/wiki/Quicksort)

  You will be given an array of numbers, you have to sort numbers in ascending order
  using quick sort algorithm.

  Quick sort algorithm uses a divide and conquer strategy.
  It takes a pivot, and sort other numbers in functions of the pivot, divided them 
  in a smaller and a bigger group. Execute this step until there is empty list.

  Example:
   [2, 1, 5, 4, 3] 
    1. pivot:2 smaller:[1] bigger:[5, 4, 3]
    2. 2 [1] [5, 4, 3]  
    3. 2 [1] | 
             | 5 [4, 3] [] 
    4. 2 [1] | 
               | 5 | 
                   | 4 [3] []
    5. [1, 2, 3, 4, 5] # Recursion reunite all splited lists.

   [2, 1, 5, 4, 3] => [1, 2, 3, 4, 5]
  Complexity: O(n log n)
  """
  require Integer

  @doc """
    take a List and return the List with the numbers ordered
  """
  @spec quick_sort(list(Integer)) :: list(Integer)
  def quick_sort([]), do: []

  def quick_sort([head | tail]) do
    smaller = Enum.filter(tail, fn x -> x <= head end) |> quick_sort()
    bigger = Enum.filter(tail, fn x -> x > head end) |> quick_sort()

    Enum.concat(smaller, [head]) |> Enum.concat(bigger)
  end
end
