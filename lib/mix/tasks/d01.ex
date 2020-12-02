defmodule Mix.Tasks.D01.P1 do
  use Mix.Task

  import AdventOfCode.Day01
  import Input.Day01

  @shortdoc "Day 01 Part 1"
  def run(_args) do
    input()
    |> find_anomalies(2, 2020)
    |> IO.inspect(label: "Part 1 Results")
  end
end

defmodule Mix.Tasks.D01.P2 do
  use Mix.Task

  import AdventOfCode.Day01
  import Input.Day01

  @shortdoc "Day 01 Part 2"
  def run(_args) do
    input()
    |> find_anomalies(3, 2020)
    |> IO.inspect(label: "Part 2 Results")
  end
end
