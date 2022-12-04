defmodule AdventOfCode.Day04 do
  import Bitwise

  def part1(input) do
    input
    |> parse_input()
    |> Enum.filter(fn line ->
      line
      |> String.trim()
      |> String.split(",")
      |> Enum.map(fn range ->
        [s,e] = range |> String.split("-") |> Enum.map(& String.to_integer(&1))
        Integer.pow(2, e - s + 1) - 1 <<< (s - 1)
      end)
      |> Enum.reduce(fn int1, int2 ->
        intersection = int1 ||| int2
        intersection == int1 or intersection == int2
      end)
    end)
    |> Enum.count()
  end

  def part2(input) do
    input
    |> parse_input()
    |> Enum.filter(fn line ->
      line
      |> String.trim()
      |> String.split(",")
      |> Enum.map(fn range ->
        [s,e] = range |> String.split("-") |> Enum.map(& String.to_integer(&1))
        Integer.pow(2, e - s + 1) - 1 <<< (s - 1)
      end)
      |> Enum.reduce(fn int1, int2 ->
        (int1 &&& int2) != 0
      end)
    end)
    |> Enum.count()
  end

  defp parse_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.trim/1)
  end
end
