defmodule AdventOfCode.Day03Test do
  use ExUnit.Case

  import AdventOfCode.Day03

  describe "tree_count/1" do
    test "returns count of trees based route and map" do
      input = [
        "..##.......",
        "#...#...#..",
        ".#....#..#.",
        "..#.#...#.#",
        ".#...##..#.",
        "..#.##.....",
        ".#.#.#....#",
        ".#........#",
        "#.##...#...",
        "#...##....#",
        ".#..#...#.#"
      ]

      assert tree_count(input, [{3, 1}]) == [7]
    end

    test "returns count of trees for multiple trajectories" do
      input = [
        "..##.......",
        "#...#...#..",
        ".#....#..#.",
        "..#.#...#.#",
        ".#...##..#.",
        "..#.##.....",
        ".#.#.#....#",
        ".#........#",
        "#.##...#...",
        "#...##....#",
        ".#..#...#.#"
      ]

      assert tree_count(input, [{1, 1}, {3, 1}, {5, 1}, {7, 1}, {1, 2}]) == [2, 7, 3, 4, 2]
    end
  end
end
