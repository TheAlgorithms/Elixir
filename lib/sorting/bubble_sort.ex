defmodule Algorithms.Sorting.BubbleSort do
  @moduledoc """
  Implementation of BubbleSort algorithm (https://en.wikipedia.org/wiki/Bubblesort)

  Given an array of numbers, sorts it in ascending order
  using the bubblesort algorithm.

  Bubble sort algorithm uses a simple iterative strategy. 
  Starting with the first element, it compares it with the second element; if 
  the first one is larger, it swaps them, remembers that it performed a swap,
  and continues to compare elements two and three, three and four and so forth.
  When it reaches the end of the array, if at least one swap was performed, it
  starts again at the beginning; if no swap was performed, the array is sorted, 
  and the algorithm terminates. 

  Example (the star denotes the current element):
   [*2, 1, 5, 4, 3] 
    1. 2 is larger than 1: swap them
    2. [1, *2, 5, 4, 3]
    3. 2 is smaller than 5: no swap, continue at next element 
    4. [1, 2, *5, 4, 3]
    5. 5 is larger than 4: swap them 
    6. [1, 2, 4, *5, 3]
    7. 5 is larger than 3: swap them 
    8. [1, 2, 4, 3, *5]
    9. end of array is reached; we performed at least one swap, so start again
    10. [*1, 2, 4, 3, 5]
    11. 1 is smaller than 2: no swap, continue at next element 
    12. [1, *2, 4, 3, 5]
    13. 2 is smaller than 4: no swap, continue at next element 
    14. [1, 2, *4, 3, 5]
    15. 4 is larger than 3: swap them
    14. [1, 2, 3, *4, 5]
    15. 4 is smaller than 5: no swap, continue at next element 
    16. [1, 2, 3, 4, *5]
    17. end of array is reached; we performed at least one swap, so start again
    (we'll skip the last couple of steps - the array is sorted, no swaps are performed, and the algorithm terminates)
   
   [2, 1, 5, 4, 3] => [1, 2, 3, 4, 5]
  Complexity: O(n*n)
  """
  require Integer

  @doc """
    take a List and return the List with the numbers ordered
  """
  @spec bubble_pass(list(Integer)) :: list(Integer)
  def bubble_pass([]), do: []

  def bubble_pass([x]), do: [x]

  def bubble_pass([x1 | [x2 | xs]]) do
    case x1 < x2 do
      true -> Enum.concat([x1], bubble_pass(Enum.concat([x2], xs)))
      false -> Enum.concat([x2], bubble_pass(Enum.concat([x1], xs)))
    end
  end

  @spec bubble_sort(list(Integer)) :: list(Integer)
  def bubble_sort(lst) do
    bpassed = bubble_pass(lst)

    case bpassed == lst do
      true -> bpassed
      false -> bubble_sort(bpassed)
    end
  end
end
