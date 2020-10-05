defmodule Sort do
    def bogo_sort(list) do
        if is_sorted?(list) do
            list
        else
            bogo_sort(Enum.shuffle(list))
        end
    end
 
    def is_sorted?(list) when length(list) <= 1, do: true
    def is_sorted?([x, y | _]) when x > y, do: false
    def is_sorted?([_, y | rest]), do: is_sorted?([y | rest])
end

IO.puts(Sort.bogo_sort([4, 8, 9, 3, 2, 7]))
