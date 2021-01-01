defmodule Algorithms.DataStructures.SinglyLinkedListTest do
  alias Algorithms.DataStructures.SinglyLinkedList
  alias SinglyLinkedList.LinkedList
  alias SinglyLinkedList.Node

  use ExUnit.Case
  doctest Algorithms

  describe "add_node_head/2" do
    test "it works when the list is empty" do
      node = %Node{value: 3, reference: nil}
      result = %SinglyLinkedList.LinkedList{nodes: [node]}
      add_node_head_result = SinglyLinkedList.add_node_head(%LinkedList{nodes: []}, 3)
      assert add_node_head_result == result
      assert SinglyLinkedList.list_length(add_node_head_result) == 1
      assert SinglyLinkedList.tail(add_node_head_result) == %Node{value: 3, reference: nil}
    end

    test "it adds to the head" do
      list =
        SinglyLinkedList.add_node_head(%LinkedList{nodes: []}, 3)
        |> SinglyLinkedList.add_node_head(4)
        |> SinglyLinkedList.add_node_head(5)
        |> SinglyLinkedList.add_node_head(6)

      assert SinglyLinkedList.list_length(list) == 4

      assert SinglyLinkedList.head(list) == %Node{
               value: 6,
               reference: %Node{
                 value: 5,
                 reference: %Node{value: 4, reference: %Node{value: 3, reference: nil}}
               }
             }

      assert SinglyLinkedList.tail(list) == %Node{value: 3, reference: nil}
    end

    test "it adds to the tail" do
      list = SinglyLinkedList.add_node_tail(%LinkedList{nodes: []}, 3)
      list = list |> SinglyLinkedList.add_node_tail(4)

      assert SinglyLinkedList.list_length(list) == 2
      assert list.nodes |> length == 2

      assert SinglyLinkedList.tail(list) == %Node{value: 4, reference: nil}

      assert SinglyLinkedList.head(list) == %Node{
               value: 3,
               reference: %Node{value: 4, reference: nil}
             }

      list =
        list
        |> SinglyLinkedList.add_node_tail(5)

      # need to just travese list
      # assert SinglyLinkedList.head(list) == %Node{
      #          value: 3,
      #          reference: %Node{
      #            value: 4,
      #            reference: %Node{value: 5, reference: nil}
      #          }
      #        }

      assert SinglyLinkedList.tail(list) == %Node{
               value: 5,
               reference: nil
             }
    end
  end
end
