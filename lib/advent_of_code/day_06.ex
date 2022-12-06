defmodule AdventOfCode.Day06 do
  def part1(input) do
    input
    |> to_charlist()
    |> Enum.chunk_every(4, 1, :discard)
    |> Enum.map(&Enum.uniq/1)
    |> Enum.map(&length/1)
    |> Enum.find_index(& &1 == 4)
    |> Kernel.+(4)
  end

  def part2(input) do
    input
    |> to_charlist()
    |> Enum.chunk_every(14, 1, :discard)
    |> Enum.map(&Enum.uniq/1)
    |> Enum.map(&length/1)
    |> Enum.find_index(& &1 == 14)
    |> Kernel.+(14)
  end
end
