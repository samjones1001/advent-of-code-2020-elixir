defmodule AdventOfCode.Day06 do
  def sum_unique_answers(input) do
    input
    |> create_groups()
    |> Enum.map(&count_of_unique_answers(&1))
    |> Enum.sum()
  end

  def sum_common_answers(input) do
    input
    |> create_groups()
    |> Enum.map(&count_of_common_answers(&1))
    |> Enum.sum()
  end

  defp create_groups(input) do
    input
    |> Enum.chunk_by(&(&1 != ""))
    |> Enum.filter(&(&1 != [""]))
  end

  defp count_of_unique_answers(answers) do
    answers
    |> Enum.join()
    |> String.graphemes()
    |> Enum.uniq()
    |> Enum.count()
  end

  defp count_of_common_answers(answers) do
    answers
    |> Enum.map(&String.graphemes(&1))
    |> Enum.map(&MapSet.new(&1))
    |> Enum.reduce(&MapSet.intersection/2)
    |> Enum.count()
  end
end
