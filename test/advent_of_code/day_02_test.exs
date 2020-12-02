defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  import AdventOfCode.Day02

  describe "valid_password_count/2" do
    test "returns count of valid passwords when old policy is applied" do
      input = ["1-3 a: abcde",
      "1-3 b: cdefg",
      "2-9 c: ccccccccc"]

      assert valid_password_count(input, :old_policy) == 2
    end

    test "returns count of valid passwords when current policy is applied" do
      input = ["1-3 a: abcde",
        "1-3 b: cdefg",
        "2-9 c: ccccccccc"]

      assert valid_password_count(input, :current_policy) == 1
    end
  end
end
