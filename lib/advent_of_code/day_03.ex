defmodule AdventOfCode.Day03 do
  def tree_count(input, trajectories) do
    {map, height, width} = build_map(input)
    Enum.map(trajectories, fn trajectory -> move({map, height, width}, {0, 0}, trajectory, 0) end)
  end

  defp move({_map, height, _width}, {_current_col, current_row}, {_right, _down}, count)
       when current_row + 1 >= height,
       do: count

  defp move({map, height, width}, {current_col, current_row}, {right, down}, count) do
    {new_col, new_row} = {rem(current_col + right, width), current_row + down}

    count =
      case get_in(map, [new_row, new_col]) do
        "#" -> count + 1
        _ -> count
      end

    move({map, height, width}, {new_col, new_row}, {right, down}, count)
  end

  defp build_map(input) do
    map =
      Enum.with_index(input)
      |> Enum.map(fn {row, index} ->
        {index,
         row
         |> String.graphemes()
         |> Enum.with_index()
         |> Enum.map(fn {col, index} -> {index, col} end)
         |> Enum.into(%{})}
      end)
      |> Enum.into(%{})

    height = map |> Map.keys() |> length
    width = map[0] |> Map.keys() |> length

    {map, height, width}
  end
end
