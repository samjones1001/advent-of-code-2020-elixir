defmodule Mix.Tasks.D04.P1 do
  use Mix.Task

  import AdventOfCode.Day04

  @shortdoc "Day 04 Part 1"
  def run(_args) do
    File.stream!("lib/input/day_04.txt")
    |> Enum.map(fn elem -> String.trim(elem) end)
    |> validate_documents(:simple)
    |> IO.inspect(label: "Part 1 Results")
  end
end

defmodule Mix.Tasks.D04.P2 do
  use Mix.Task

  import AdventOfCode.Day04

  @shortdoc "Day 04 Part 2"
  def run(_args) do
    File.stream!("lib/input/day_04.txt")
    |> Enum.map(fn elem -> String.trim(elem) end)
    |> validate_documents(:advanced)
    |> IO.inspect(label: "Part 2 Results")
  end
end