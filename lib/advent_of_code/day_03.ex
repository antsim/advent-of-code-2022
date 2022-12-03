defmodule AdventOfCode.Day03 do
  @priorities [?a..?z, ?A..?Z]
  |> Enum.concat()
  |> Enum.with_index(1)
  |> Map.new()

  def part1(input) do
    input
    |> parse_input()
    |> Enum.map(&:binary.bin_to_list/1)
    |> Enum.map(&Enum.split(&1, div(length(&1), 2)))
    |> Enum.map(fn {f, r} -> Enum.uniq(f -- f -- r) end)
    |> Enum.flat_map(fn intersection -> Enum.map(intersection, &@priorities[&1]) end)
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> parse_input()
    |> Enum.map(&:binary.bin_to_list/1)
    |> Enum.map(&MapSet.new/1)
    |> Enum.chunk_every(3)
    |> Enum.flat_map(fn group -> Enum.reduce(group, &MapSet.intersection/2) end)
    |> Enum.map(&@priorities[&1])
    |> Enum.sum()
  end

  defp parse_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.trim/1)
  end
end
