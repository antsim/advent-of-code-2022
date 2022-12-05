defmodule AdventOfCode.Day05 do
  def move_crates(crates, quantity, from, to) do
    from = from - 1
    to = to - 1
    {crates_to_move, remaining} = Enum.at(crates, from) |> Enum.split(quantity)
    crates
    |> Enum.with_index
    |> Enum.reduce([], fn {stack, index}, acc ->
      case index do
        ^from -> acc ++ [remaining]
        #^to -> acc ++ [Enum.concat(Enum.reverse(crates_to_move), stack)]
        ^to -> acc ++ [Enum.concat(crates_to_move, stack)]
        _ -> acc ++ [stack]
       end
    end)
  end

  def part1(input) do
    startingStacks = [
      ["G", "P", "N", "R"],
      ["H", "V", "S", "C", "L", "B", "J", "T"],
      ["L", "N", "M", "B", "D", "T"],
      ["B", "S", "P", "V", "R"],
      ["H", "V", "M", "W", "S", "Q", "C", "G"],
      ["J", "B", "D", "C", "S", "Q", "W"],
      ["L", "Q", "F"],
      ["V", "F", "L", "D", "T", "H", "M", "W"],
      ["F", "J", "M", "V", "B", "P", "L"]
    ]

    input
    |> parse_input()
    |> Enum.map(fn line ->
      String.split(line, ["move","from"," to"], trim: true)
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.reduce(startingStacks, fn [count, from, to], acc ->
      AdventOfCode.Day05.move_crates(acc, count, from, to)
    end)
    |> Enum.map(&hd/1)
    |> Enum.join()
  end

  def part2(input) do
    startingStacks = [
      ["G", "P", "N", "R"],
      ["H", "V", "S", "C", "L", "B", "J", "T"],
      ["L", "N", "M", "B", "D", "T"],
      ["B", "S", "P", "V", "R"],
      ["H", "V", "M", "W", "S", "Q", "C", "G"],
      ["J", "B", "D", "C", "S", "Q", "W"],
      ["L", "Q", "F"],
      ["V", "F", "L", "D", "T", "H", "M", "W"],
      ["F", "J", "M", "V", "B", "P", "L"]
    ]

    input
    |> parse_input()
    |> Enum.map(fn line ->
      String.split(line, ["move","from"," to"], trim: true)
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.reduce(startingStacks, fn [count, from, to], acc ->
      AdventOfCode.Day05.move_crates(acc, count, from, to)
    end)
    |> Enum.map(&hd/1)
    |> Enum.join()
  end

  defp parse_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.trim/1)
  end
end
