defmodule Algorithms.DataStructures.SinglyLinkedList do
  @moduledoc """
  Access for SinglyLinkedList is O(n)
  Search for SinglyLinkedList is O(n)
  Deletion/Insertion at element is O(1)
  """
  defmodule Node, do: defstruct([:value, :reference])
  defmodule LinkedList, do: defstruct([:nodes])

  @doc """
  Adding to the head of a SinglyLinkedList is O(1), as you know where the head is
  """
  def add_node_head(%LinkedList{nodes: []}, value) do
    first_link = form_link(value, nil)
    %LinkedList{nodes: [first_link]}
  end

  def add_node_head(%LinkedList{nodes: [head | _tail] = list}, value) do
    new_head = form_link(value, head)
    %LinkedList{nodes: [new_head | list]}
  end

  @doc """
  Adding to the tail/middle of a SinglyLinkedList is O(1)
  """
  def add_node_tail(%LinkedList{nodes: []} = list, value) do
    add_node_head(list, value)
  end

  def add_node_tail(%LinkedList{nodes: [head | []]}, value) do
    old_tail = head
    new_tail = form_tail_link(value)
    old_tail = %Node{value: old_tail.value, reference: new_tail}
    new_nodes = [old_tail] ++ [new_tail]

    %LinkedList{nodes: new_nodes}
  end

  def add_node_tail(%LinkedList{nodes: nodes} = list, value) do
    old_tail = tail(list)
    new_tail = form_tail_link(value)
    old_tail = %Node{value: old_tail.value, reference: new_tail}
    new_nodes = nodes |> List.delete_at(-1)
    new_nodes = new_nodes ++ [old_tail] ++ [new_tail]

    %LinkedList{nodes: new_nodes}
  end

  def list_length(%LinkedList{nodes: []}), do: 0
  def list_length(%LinkedList{nodes: nodes}), do: nodes |> length()

  def head(%LinkedList{nodes: nodes}), do: nodes |> List.first()

  def tail(%LinkedList{nodes: [current_tail | []]}) do
    current_tail
  end

  def tail(%LinkedList{nodes: []}), do: nil

  def tail(%LinkedList{nodes: [_current_head | current_tails]}) do
    tail(%LinkedList{nodes: current_tails})
  end

  defp form_link(value, reference) do
    %__MODULE__.Node{value: value, reference: reference}
  end

  defp form_tail_link(value) do
    %__MODULE__.Node{value: value, reference: nil}
  end
end
