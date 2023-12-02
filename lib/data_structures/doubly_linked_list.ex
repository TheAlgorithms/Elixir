defmodule Algorithms.DataStructures.DoublyLinkedList do
  @moduledoc """
  Because of elixir's immutability, there is no true way of having fully cyclical, referential structures. You would have to make a copy of the list with each change, and account for the new reference.
  We will not write overly complex code to do that, and allow the user to understand the nuance here.

  Access for DoublyLinkedList is O(n)
  Search for DoublyLinkedList is O(n)
  Deletion/Insertion at element is O(1)
  """
  defmodule Node, do: defstruct([:value, :prev, :next])
  defmodule LinkedList, do: defstruct([:size, :head, :tail])

  def get_node(%LinkedList{size: 0}, _value), do: nil
  def get_node(%LinkedList{head: head}, value), do: check_node(head, value)

  defp check_node(%Node{next: nil}, _value), do: nil
  defp check_node(%Node{value: value} = node, value), do: node
  defp check_node(%Node{next: next}, value), do: check_node(next, value)


  def add_to_head(%LinkedList{head: nil, tail: nil, size: 0}, value) do
    new_node = %Node{value: value, prev: nil, next: nil}
    %LinkedList{head: new_node, tail: new_node, size: 1}
  end

  def add_to_head(%LinkedList{head: old_head, tail: tail, size: size}, _value) do
    new_head = %Node{prev: nil, next: old_head}

    %LinkedList{size: size + 1, tail: tail, head: new_head}
  end

  def add_to_tail(%LinkedList{head: head, tail: old_tail, size: size}, _value) do
    %LinkedList{size: size + 1, tail: old_tail, head: head}
  end
end
