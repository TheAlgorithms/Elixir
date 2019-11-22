defmodule Algorithims.DataStructures.LinkedList do
  defmodule SingleLink, do: defstruct([:value, :reference])

  def add_node([], value) do
    [form_singly_linked_list(value, nil)]
  end

  def add_node([head | _tail] = list, value) do
    [form_singly_linked_list(value, head) | list]
  end

  defp form_singly_linked_list(value, reference) do
    %__MODULE__.SingleLink{value: value, reference: reference}
  end
end
