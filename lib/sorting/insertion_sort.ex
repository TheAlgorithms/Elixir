defmodule Algorithms.Sorting.InsertionSort do
  @moduledoc """
  Implementation of InsertionSort algorithm (https://en.wikipedia.org/wiki/Insertion_sort)

  You will be given an array of numbers, you have to sort numbers in ascending order
  using insertion sort algorithm.

  Insertion sort iterates, consuming one input element each repetition,
  and grows a sorted output list. At each iteration, insertion sort removes one
  element from the input data, finds the location it belongs within the sorted list,
  and inserts it there. It repeats until no input elements remain.

  Example:
    Input: [7, 4, 5, 2]

    1. ["7", 4, 5]                  ------ Start
    2. ["7", "4", 5] -> [4, "7", 5] ------ 7 > 4 : Insert 7 in forward of 4
    3. [4, "7", "5"] -> [4, 5, "7"] ------ 7 > 5 : Insert 7 in forward of 5
    4. [4, 5, 7]                    ------

   Complexity: O(n^2)
  """
  require Integer

  @doc """
    take a List and return the List with the numbers ordered
  """
  @spec insertion_sort(list(Integer)) :: list(Integer)
  def insertion_sort(list) do
    do_sort([], list)
  end

  def do_sort([], [head | tail]) do
    do_sort([head], tail)
  end

  def do_sort(sorted_list, [head | tail]) do
    insert(head, sorted_list) |> do_sort(tail)
  end

  def do_sort(sorted_list, []) do
    sorted_list
  end

  def insert(elem, []) do
    [elem]
  end

  def insert(elem, sorted_list) do
    [min | rest] = sorted_list

    if min >= elem do
      [elem | [min | rest]]
    else
      [min | insert(elem, rest)]
    end
  end
end
