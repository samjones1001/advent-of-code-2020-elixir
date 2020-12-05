defmodule AdventOfCode.Day04 do
  @required_fields ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

  def validate_documents(input, validation_type) do
    input
    |> build_records()
    |> Enum.filter(&validate_record(&1, validation_type))
    |> Enum.count()
  end

  defp build_records(input) do
    input
    |> Enum.chunk_by(&(&1 != ""))
    |> Enum.filter(&(&1 != [""]))
    |> Enum.map(&Enum.join(&1, " "))
    |> Enum.map(&build_record_map(&1))
  end

  defp build_record_map(record_string) do
    record_string
    |> String.split(" ")
    |> Enum.map(fn field ->
      [key, value] = String.split(field, ":")
      {key, value}
    end)
    |> Enum.into(%{})
  end

  defp validate_record(record, :simple = _validation_type), do: all_fields_present?(record)

  defp validate_record(record, :advanced = _validation_type) do
    all_fields_present?(record) and all_fields_valid?(record)
  end

  defp all_fields_present?(record) do
    @required_fields |> Enum.all?(&Map.has_key?(record, &1))
  end

  defp all_fields_valid?(record), do: Enum.all?(record, fn {field, value} -> valid_field?(field, value) end)

  defp valid_field?("byr" = _field, year), do: String.to_integer(year) in 1920..2002

  defp valid_field?("iyr" = _field, year), do: String.to_integer(year) in 2010..2020

  defp valid_field?("eyr" = _field, year), do: String.to_integer(year) in 2020..2030

  defp valid_field?("hgt" = _field, {height, "cm"}), do: String.to_integer(height) in 150..193

  defp valid_field?("hgt" = _field, {height, "in"}), do: String.to_integer(height) in 59..76

  defp valid_field?("hgt" = _field, {_, _}), do: false

  defp valid_field?("hgt" = _field, height), do: valid_field?("hgt", {String.slice(height, 0..-3), String.slice(height, -2..-1)})

  defp valid_field?("hcl" = _field, colour), do: Regex.match?(~r/^#[0-9a-f]{6}$/, colour)

  defp valid_field?("ecl" = _field, colour), do: colour in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]

  defp valid_field?("pid" = _field, id), do: String.length(id) == 9

  defp valid_field?("cid" = _field, _id), do: true
end
