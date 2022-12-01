defmodule AdventOfCode.Day01 do
  def part1(input) do
    input
    |> parse_input()
    |> Enum.chunk_by(fn(n) -> n == "" end)
    |> Enum.reject(&Enum.member?(&1, ""))
    |> Enum.map(fn list -> Enum.map(list, &String.to_integer/1) end)
    |> Enum.map(fn list -> Enum.sum(list) end)
    |> Enum.max()
  end

  def part2(input) do
    input
    |> parse_input()
    |> Enum.chunk_by(fn(n) -> n == "" end)
    |> Enum.reject(&Enum.member?(&1, ""))
    |> Enum.map(fn list -> Enum.map(list, &String.to_integer/1) end)
    |> Enum.map(fn list -> Enum.sum(list) end)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end

  defp parse_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.trim/1)
  end
end
