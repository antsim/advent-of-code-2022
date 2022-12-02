defmodule AdventOfCode.Day02 do
  def part1(input) do
    input
    |> parse_input()
    |> Enum.reduce(0, fn line, score -> score + score_line(String.trim(line)) end)
  end

  defp score_line("A X"), do: 4
  defp score_line("A Y"), do: 8
  defp score_line("A Z"), do: 3
  defp score_line("B X"), do: 1
  defp score_line("B Y"), do: 5
  defp score_line("B Z"), do: 9
  defp score_line("C X"), do: 7
  defp score_line("C Y"), do: 2
  defp score_line("C Z"), do: 6

  def part2(input) do
    input
    |> parse_input()
    |> Enum.reduce(0, fn line, score -> score + score_line_pt2(String.trim(line)) end)
  end

  defp score_line_pt2("A X"), do: score_line("A Z")
  defp score_line_pt2("A Y"), do: score_line("A X")
  defp score_line_pt2("A Z"), do: score_line("A Y")
  defp score_line_pt2("B X"), do: score_line("B X")
  defp score_line_pt2("B Y"), do: score_line("B Y")
  defp score_line_pt2("B Z"), do: score_line("B Z")
  defp score_line_pt2("C X"), do: score_line("C Y")
  defp score_line_pt2("C Y"), do: score_line("C Z")
  defp score_line_pt2("C Z"), do: score_line("C X")

  defp parse_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.trim/1)
  end
end
