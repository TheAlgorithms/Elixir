defmodule Algorithims.DataStructures.SinglyLinkedListTest do
  alias Algorithims.DataStructures.SinglyLinkedList

  use ExUnit.Case
  doctest Algorithims

  describe "add_node/2" do
    test "it works when the list is empty" do
      assert SinglyLinkedList.add_node([], 3) == [
               %SinglyLinkedList.SingleLink{
                 value: 3,
                 reference: nil
               }
             ]
    end

    test "it adds to the head" do
      list =
        SinglyLinkedList.add_node([], 3)
        |> SinglyLinkedList.add_node(4)
        |> SinglyLinkedList.add_node(5)

      assert list == [
               %Algorithims.DataStructures.SinglyLinkedList.SingleLink{
                 reference: %Algorithims.DataStructures.SinglyLinkedList.SingleLink{
                   reference: %Algorithims.DataStructures.SinglyLinkedList.SingleLink{
                     reference: nil,
                     value: 3
                   },
                   value: 4
                 },
                 value: 5
               },
               %Algorithims.DataStructures.SinglyLinkedList.SingleLink{
                 reference: %Algorithims.DataStructures.SinglyLinkedList.SingleLink{
                   reference: nil,
                   value: 3
                 },
                 value: 4
               },
               %Algorithims.DataStructures.SinglyLinkedList.SingleLink{reference: nil, value: 3}
             ]
    end
  end
end
