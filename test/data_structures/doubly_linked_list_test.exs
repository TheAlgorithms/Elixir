defmodule Algorithms.DataStructures.DoublyLinkedListTest do
  alias Algorithms.DataStructures.DoublyLinkedList
  alias DoublyLinkedList.LinkedList
  alias DoublyLinkedList.Node

  use ExUnit.Case
  doctest Algorithms

  describe "get_node/1" do
    test "it works when the list is empty" do
    end

    test "it works when the list is not empty" do
    end
  end

  describe "add_to_head/1" do
    test "it works when the list is empty" do
      res = DoublyLinkedList.add_to_head(%LinkedList{head: nil, tail: nil, size: 0}, 1)
      assert res.size == 1
      assert res.head == %Node{value: 1, prev: nil, next: nil}
      assert res.tail == %Node{value: 1, prev: nil, next: nil}
    end

    test "it works when the list is not empty" do
      # res =
      #   DoublyLinkedList.add_to_head(%LinkedList{head: nil, tail: nil, size: 0}, 10)
      #   |> DoublyLinkedList.add_to_head(3)
      #   |> DoublyLinkedList.add_to_head(5)
      #   |> DoublyLinkedList.add_to_head(-1)
      #
      # assert head = res.head
      # assert head.prev == nil
      # assert head.value == 10
      # assert head.next.value == 3
      #
      # assert tail = res.tail
      # assert tail.prev.value == 5
      # assert tail.value == -1
      # assert tail.next == nil
    end
  end
end
