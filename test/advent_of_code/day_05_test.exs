defmodule AdventOfCode.Day05Test do
  use ExUnit.Case

  import AdventOfCode.Day05

  describe "max_boarding_id/1" do
    test "returns the highest seat number from a list of passes" do
      input = [
        "BFFFBBFRRR",
        "FFFBBBFRRR",
        "BBFFBBFRLL",
      ]

      assert max_boarding_id(input) == 820
    end
  end
end