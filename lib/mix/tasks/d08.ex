defmodule Mix.Tasks.D08.P1 do
  use Mix.Task

  import AdventOfCode.Day08

  @shortdoc "Day 08 Part 1"
  def run(_args) do
    File.stream!("lib/input/day_08.txt")
    |> Enum.map(fn elem -> String.trim(elem) end)
    |> final_valid_value()
    |> IO.inspect(label: "Part 1 Results")
  end
end

defmodule Mix.Tasks.D08.P2 do
  use Mix.Task

  import AdventOfCode.Day08

  @shortdoc "Day 08 Part 2"
  def run(_args) do
    File.stream!("lib/input/day_08.txt")
    |> Enum.map(fn elem -> String.trim(elem) end)
    |> final_value()
    |> IO.inspect(label: "Part 2 Results")
  end
end
