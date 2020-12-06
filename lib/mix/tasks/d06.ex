defmodule Mix.Tasks.D06.P1 do
  use Mix.Task

  import AdventOfCode.Day06

  @shortdoc "Day 06 Part 1"
  def run(_args) do
    File.stream!("lib/input/day_06.txt")
    |> Enum.map(fn elem -> String.trim(elem) end)
    |> sum_unique_answers()
    |> IO.inspect(label: "Part 1 Results")
  end
end

defmodule Mix.Tasks.D06.P2 do
  use Mix.Task

  import AdventOfCode.Day06

  @shortdoc "Day 06 Part 2"
  def run(_args) do
    File.stream!("lib/input/day_06.txt")
    |> Enum.map(fn elem -> String.trim(elem) end)
    |> sum_common_answers()
    |> IO.inspect(label: "Part 2 Results")
  end
end