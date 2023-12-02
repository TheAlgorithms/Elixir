defmodule Algorithms.DataStructures.DoublyLinkedListTest do
  alias Algorithms.DataStructures.DoublyLinkedList
  alias DoublyLinkedList.LinkedList
  alias DoublyLinkedList.Node

  use ExUnit.Case

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
  end
end
