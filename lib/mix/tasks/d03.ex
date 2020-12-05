defmodule Mix.Tasks.D03.P1 do
  use Mix.Task

  import AdventOfCode.Day03

  @shortdoc "Day 03 Part 1"
  def run(_args) do
    File.stream!("lib/input/day_03.txt")
    |> Enum.map(fn elem -> String.trim(elem) end)
    |> tree_count([{3, 1}])
    |> IO.inspect(label: "Part 1 Results")
  end
end

defmodule Mix.Tasks.D04.P2 do
  use Mix.Task

  import AdventOfCode.Day03

  @shortdoc "Day 03 Part 2"
  def run(_args) do
    File.stream!("lib/input/day_03.txt")
    |> Enum.map(fn elem -> String.trim(elem) end)
    |> tree_count([{1, 1}, {3, 1}, {5, 1}, {7, 1}, {1, 2}])
    |> IO.inspect(label: "Part 1 Results")
  end
end
