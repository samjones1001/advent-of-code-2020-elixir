defmodule AdventOfCode.Day08 do
  def final_valid_value(input) do
    instructions =
      input
      |> Enum.map(&String.split(&1, " "))
      |> Enum.map(&parse_line(&1))

    {_, accumulator, _} = check_instruction(instructions, 0, 0, [])
    accumulator
  end

  def final_value(input) do
    instructions =
      input
      |> Enum.map(&String.split(&1, " "))
      |> Enum.map(&parse_line(&1))

    {:crash, _, visited} = check_instruction(instructions, 0, 0, [])

    {_, accumulator, _} =
      possible_errors(instructions, visited)
      |> find_fix(instructions)

    accumulator
  end

  defp parse_line([command, offset]) do
    {command, String.to_integer(offset)}
  end

  defp check_instruction(instructions, accumulator, current_index, visited)
       when current_index >= length(instructions),
       do: {:exit, accumulator, visited}

  defp check_instruction(instructions, accumulator, current_index, visited) do
    case Enum.member?(visited, current_index) do
      true -> {:crash, accumulator, visited}
      false -> perform_instruction(instructions, accumulator, current_index, visited)
    end
  end

  defp perform_instruction(instructions, accumulator, current_index, visited) do
    visited = visited ++ [current_index]

    case Enum.at(instructions, current_index) do
      {"acc", offset} ->
        check_instruction(instructions, accumulator + offset, current_index + 1, visited)

      {"jmp", offset} ->
        check_instruction(instructions, accumulator, current_index + offset, visited)

      {"nop", _offset} ->
        check_instruction(instructions, accumulator, current_index + 1, visited)
    end
  end

  defp possible_errors(instructions, visited_indexes) do
    visited_indexes
    |> Enum.map(&{&1, Enum.at(instructions, &1)})
    |> Enum.filter(fn {_, {command, _}} -> command == "jmp" or command == "nop" end)
  end

  defp find_fix(possible_errors, instructions) do
    possible_errors
    |> Enum.map(fn {index, {command, offset}} ->
      attempt_fix(instructions, index, command, offset)
    end)
    |> Enum.filter(fn {exit_code, _, _} -> exit_code == :exit end)
    |> Enum.at(0)
  end

  defp attempt_fix(instructions, index, command, offset) do
    List.replace_at(instructions, index, {swap_command(command), offset})
    |> check_instruction(0, 0, [])
  end

  defp swap_command(command) do
    case command do
      "nop" -> "jmp"
      "jmp" -> "nop"
    end
  end
end
