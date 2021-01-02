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

  def get_node(%LinkedList{size: _size, head: head, tail: _tail}, value) do
    check_node(head, value)
  end

  defp check_node(%Node{value: value, next: nil} = node, _value), do: nil

  defp check_node(%Node{value: value, next: next} = node, value) do
    if node.value == value do
      node
    else
      check_node(node.next, value)
    end
  end

  def set_node(list, value) do
  end

  def add_to_head(%LinkedList{head: nil, tail: nil, size: 0}, value) do
    new_node = %Node{value: value, prev: nil, next: nil}
    %LinkedList{head: new_node, tail: new_node, size: 1}
  end

  def add_to_head(%LinkedList{head: old_head, tail: tail, size: size}, value) do
    new_head = %Node{prev: nil, next: old_head}
    old_head = %Node{prev: new_head, next: old_head.next}
    %LinkedList{size: size + 1, tail: tail, head: new_head}
  end

  def add_to_tail(%LinkedList{head: head, tail: old_tail, size: size}, value) do
    new_tail = %Node{prev: old_tail, next: nil}
    # old_tail.next = new_tail
    %LinkedList{size: size + 1, tail: old_tail, head: head}
  end

  defp remove(%LinkedList{size: 0}, value), do: nil

  defp remove(%LinkedList{size: size, head: head, tail: tail} = list, value) do
    node_to_remove =
      case get_node(list, value) do
        nil -> raise "No node"
        node -> node
      end

    # in elixir need to actually update references, this won't work in functional programming.
    # previous = node_to_remove.prev
    # next = node_to_remove.next
    # previous.next = next
    # next.previous = previous
    %LinkedList{size: size - 1, head: head, tail: tail}
  end
end
