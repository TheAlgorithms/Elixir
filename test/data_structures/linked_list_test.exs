defmodule Algorithims.DataStructures.LinkedListTest do
  alias Algorithims.DataStructures.LinkedList

  use ExUnit.Case
  doctest Algorithims

  describe "add_node/2" do
    test "it works when the list is empty" do
      assert LinkedList.add_node([], 3) == [
               %LinkedList.SingleLink{
                 value: 3,
                 reference: nil
               }
             ]
    end

    test "it adds to the head" do
      list =
        LinkedList.add_node([], 3)
        |> LinkedList.add_node(4)
        |> LinkedList.add_node(5)

      assert list == [
               %Algorithims.DataStructures.LinkedList.SingleLink{
                 reference: %Algorithims.DataStructures.LinkedList.SingleLink{
                   reference: %Algorithims.DataStructures.LinkedList.SingleLink{
                     reference: nil,
                     value: 3
                   },
                   value: 4
                 },
                 value: 5
               },
               %Algorithims.DataStructures.LinkedList.SingleLink{
                 reference: %Algorithims.DataStructures.LinkedList.SingleLink{
                   reference: nil,
                   value: 3
                 },
                 value: 4
               },
               %Algorithims.DataStructures.LinkedList.SingleLink{reference: nil, value: 3}
             ]
    end
  end
end
