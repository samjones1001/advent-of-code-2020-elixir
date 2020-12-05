defmodule AdventOfCode.Day05 do
  @row_numbers 0..127
  @seat_numbers 0..7

  def max_boarding_id(input) do
    input |> boarding_ids() |> Enum.max
  end

  def find_gap(input) do
    ids = input |> boarding_ids |> Enum.sort
    range = Enum.at(ids, 0)..Enum.at(ids, -1)

    Enum.reject(range, fn id -> Enum.member?(ids, id) end)
  end

  defp boarding_ids(input) do
    input
    |> Enum.map(& seat_number(String.graphemes(&1), @row_numbers, @seat_numbers))
    |> Enum.map(& boarding_id(&1))
  end

  defp seat_number(ticket_number, rows, seats) do
    {row, seat} = ticket_number
      |> Enum.reduce({rows, seats}, fn
        "F", {rows, seats} -> {reduce_range(rows, :lower), seats}
        "B", {rows, seats} -> {reduce_range(rows, :upper), seats}
        "L", {rows, seats} -> {rows, reduce_range(seats, :lower)}
        "R", {rows, seats} -> {rows, reduce_range(seats, :upper)}
      end)

    {Enum.at(row, 0), Enum.at(seat, 0)}
  end

  defp reduce_range(first.._last = range, :lower) do
    new_size = range |> Enum.count |> div(2)
    first..(first + new_size-1)
  end

  defp reduce_range(_first..last =range, :upper) do
    new_size = range |> Enum.count |> div(2)
    (last - new_size+1) .. last
  end

  defp boarding_id({row, seat}), do: row * 8 + seat
end
