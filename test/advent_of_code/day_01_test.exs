defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01

  describe "find_anomolies/3" do
    test "locates correct combinations of two" do
      input = [1721,
        979,
        366,
        299,
        675,
        1456]
      result = find_anomalies(input, 2, 2020)
      assert result == [[1721, 299]]
    end

    test "locates correct combinations of three" do
      input = [1721,
        979,
        366,
        299,
        675,
        1456]
      result = find_anomalies(input, 3, 2020)
      assert result == [[979, 366, 675]]
    end
  end
end
