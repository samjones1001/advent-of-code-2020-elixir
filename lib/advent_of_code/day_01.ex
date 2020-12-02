defmodule AdventOfCode.Day01 do
  def find_anomalies(expenses, size, target) do
    combinations(expenses, size)
    |> Enum.filter(fn combination -> Enum.sum(combination) == target end)
  end

  defp combinations(_expenses, 0), do: [[]]

  defp combinations(expenses = [], _size), do: expenses

  defp combinations([head | tail], size) do
    Enum.map(combinations(tail, size - 1), &[head | &1]) ++ combinations(tail, size)
  end
end
