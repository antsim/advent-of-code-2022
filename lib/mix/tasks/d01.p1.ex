defmodule Mix.Tasks.D01.P1 do
  use Mix.Task

  import AdventOfCode.Day01

  @shortdoc "Day 01 Part 1"
  def run(args) do
    input = input()

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> part1() end}),
      else:
        input
        |> part2()
        |> IO.inspect(label: "Part 2 Results")
  end

  defp input() do
    File.read!("inputs/input1.txt")
    #|> String.split(["\n", "\r", "\r\n"], trim: true)
  end
end
