defmodule Algorithms.BitManipulation.SetBit do
  import Bitwise

  @moduledoc """
    Set the K-th bit of a given number (https://www.geeksforgeeks.org/set-k-th-bit-given-number/)

    ## Parameters

    - number: Input number to insert the a new bit.
    - k: The nth bit to set.

    ## Examples

        iex> SetBit.setKthBit(10, 2)
        14

        iex> SetBit.setKthBit(2, 0)
        3

  """

  def setKthBit(number, k) do
    number ||| 1 <<< k
  end
end
