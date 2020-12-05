defmodule Mix.Tasks.D05.P1 do
  use Mix.Task

  import AdventOfCode.Day05

  @shortdoc "Day 05 Part 1"
  def run(_args) do
    File.stream!("lib/input/day_05.txt")
    |> Enum.map(fn elem -> String.trim(elem) end)
    |> max_boarding_id()
    |> IO.inspect(label: "Part 1 Results")
  end
end

defmodule Mix.Tasks.D05.P2 do
  use Mix.Task

  import AdventOfCode.Day05

  @shortdoc "Day 05 Part 2"
  def run(_args) do
    File.stream!("lib/input/day_05.txt")
    |> Enum.map(fn elem -> String.trim(elem) end)
    |> find_gap()
    |> IO.inspect(label: "Part 2 Results")
  end
end