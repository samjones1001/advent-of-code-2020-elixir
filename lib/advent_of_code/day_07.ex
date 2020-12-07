defmodule AdventOfCode.Day07 do
  def bag_options(input, target_colour) do
    rules = input |> build_rules_map

    Enum.reduce(rules, 0, fn {_color, contents}, sum ->
      case can_hold_colour?(rules, contents, target_colour) do
        true -> sum + 1
        _ -> sum
      end
    end)
  end

  def bag_count(input, target_colour) do
    rules = input |> build_rules_map

    count_bags_for_colour(rules, target_colour) - 1
  end

  defp build_rules_map(input) do
    input
    |> Enum.reject(&String.contains?(&1, "no other bags"))
    |> Enum.map(&parse_lines(&1))
    |> Enum.into(%{})
  end

  defp parse_lines(line) do
    line
    |> String.replace(["bags", "contain", "bag"], "")
    |> String.replace(~r/\s+|\./, " ")
    |> String.trim()
    |> String.split(",")
    |> Enum.map(fn part -> String.trim(part) |> String.split(" ") end)
    |> build_rules()
  end

  defp build_rules([[adjective, colour | next_rule] | remaining_rules]) do
    {"#{adjective} #{colour}", add_next_rule([next_rule | remaining_rules])}
  end

  defp add_next_rule([]), do: []

  defp add_next_rule([[quantity, adjective, colour] | remaining_rules]) do
    [{String.to_integer(quantity), "#{adjective} #{colour}"} | add_next_rule(remaining_rules)]
  end

  defp can_hold_colour?(_rules, [], _), do: false

  defp can_hold_colour?(_rules, [{_, color} | _remaining_rules], color), do: true

  defp can_hold_colour?(rules, [{_, other_colour} | remaining_rules], color) do
    can_hold_colour?(rules, remaining_rules, other_colour) ||
      can_hold_colour?(rules, Map.get(rules, other_colour, []), color)
  end

  defp count_bags_for_colour(rules, colour) do
    Map.get(rules, colour, [])
    |> Enum.reduce(1, fn {quantity, colour}, sum ->
      sum + quantity * count_bags_for_colour(rules, colour)
    end)
  end
end
