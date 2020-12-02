defmodule Mix.Tasks.D02.P1 do
  use Mix.Task

  import AdventOfCode.Day02

  @shortdoc "Day 02 Part 1"
  def run(_args) do
    File.stream!("lib/input/day_02.txt")
    |> Enum.map(fn elem -> String.trim(elem) end)
    |> valid_password_count(:old_policy)
    |> IO.inspect(label: "Part 1 Results")
  end
end

defmodule Mix.Tasks.D02.P2 do
  use Mix.Task

  import AdventOfCode.Day02

  @shortdoc "Day 02 Part 1"
  def run(_args) do
    File.stream!("lib/input/day_02.txt")
    |> Enum.map(fn elem -> String.trim(elem) end)
    |> valid_password_count(:current_policy)
    |> IO.inspect(label: "Part 2 Results")
  end
end