defmodule AdventOfCode.Day02 do
  def valid_password_count(passwords, policy) do
    Enum.filter(passwords, fn password_record ->
      split_record(password_record) |> apply_policy(policy)
    end)
    |> Enum.count()
  end

  defp apply_policy([_, low, high, letter, password] = _record, :old_policy = _policy) do
    count = password |> String.graphemes() |> Enum.count(& &1 == letter)
    Enum.member?(String.to_integer(low)..String.to_integer(high), count)
  end

  defp apply_policy([_, first, second, letter, password] = _record, :current_policy = _policy) do
    at_first = String.at(password, String.to_integer(first) - 1) == letter
    at_second = String.at(password, String.to_integer(second) - 1) == letter

    xor(at_first, at_second)
  end

  defp split_record(password_record) do
    Regex.run(~r/^(\d+)-(\d+) ([a-z]): ([a-z]+)$/, password_record)
  end

  defp xor(first, second), do: (first and not second) or (second and not first)
end