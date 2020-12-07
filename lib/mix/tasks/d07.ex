defmodule Mix.Tasks.D07.P1 do
  use Mix.Task

  import AdventOfCode.Day07

  @shortdoc "Day 07 Part 1"
  def run(_args) do
    File.stream!("lib/input/day_07.txt")
    |> Enum.map(fn elem -> String.trim(elem) end)
    |> bag_options("shiny gold")
    |> IO.inspect(label: "Part 1 Results")
  end
end

defmodule Mix.Tasks.D07.P2 do
  use Mix.Task

  import AdventOfCode.Day07

  @shortdoc "Day 07 Part 2"
  def run(_args) do
    File.stream!("lib/input/day_07.txt")
    |> Enum.map(fn elem -> String.trim(elem) end)
    |> bag_count("shiny gold")
    |> IO.inspect(label: "Part 2 Results")
  end
end
