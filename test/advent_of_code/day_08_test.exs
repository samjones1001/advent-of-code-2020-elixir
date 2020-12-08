defmodule AdventOfCode.Day08Test do
  use ExUnit.Case

  import AdventOfCode.Day08

  describe "final_valid_value/1" do
    test "returns the value of the accumulator before an instruction is run for the second time" do
      input = [
        "nop +0",
        "acc +1",
        "jmp +4",
        "acc +3",
        "jmp -3",
        "acc -99",
        "acc +1",
        "jmp -4",
        "acc +6"
      ]

      assert final_valid_value(input) == 5
    end
  end

  describe "final_value/1" do
    test "returns the valuue of the accumulator after the program terminates correctly" do
      input = [
        "nop +0",
        "acc +1",
        "jmp +4",
        "acc +3",
        "jmp -3",
        "acc -99",
        "acc +1",
        "jmp -4",
        "acc +6"
      ]

      assert final_value(input) == 8
    end
  end
end
