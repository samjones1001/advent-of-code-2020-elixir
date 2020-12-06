defmodule AdventOfCode.Day06Test do
  use ExUnit.Case

  import AdventOfCode.Day06

  describe "sum_unique_answers/1" do
    test "returns the sum of all unique positive answers for each group" do
      input = [
        "abc",
        "",
        "a",
        "b",
        "c",
        "",
        "ab",
        "ac",
        "",
        "a",
        "a",
        "a",
        "a",
        "",
        "b"
      ]

      assert sum_unique_answers(input) == 11
    end
  end

  describe "sum_common_answers/1" do
    test "returns the sum of all questions where all members of a group have answered positively" do
      input = [
        "abc",
        "",
        "a",
        "b",
        "c",
        "",
        "ab",
        "ac",
        "",
        "a",
        "a",
        "a",
        "a",
        "",
        "b"
      ]

      assert sum_common_answers(input) == 6
    end
  end
end
