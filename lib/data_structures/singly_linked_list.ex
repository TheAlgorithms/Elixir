defmodule Algorithims.DataStructures.SinglyLinkedList do
  defmodule SingleLink, do: defstruct([:value, :reference])

  def add_node([], value) do
    [form_link(value, nil)]
  end

  def add_node([head | _tail] = list, value) do
    [form_link(value, head) | list]
  end

  defp form_link(value, reference) do
    %__MODULE__.SingleLink{value: value, reference: reference}
  end
end
