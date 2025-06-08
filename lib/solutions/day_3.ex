  defmodule Solutions.Day3 do

    def partA do
      IO.puts("| Day 3 | Part A | Solution \n")

      result = "data/3_input.txt"
        |> File.read!()
        |> String.split("\n", trim: true)
        |> Enum.with_index()
        |> Enum.count( fn {line, idx} ->
              col = rem(idx * 3, 31)
              String.at(line, col) == "#"
            end)

      IO.puts("Result: #{result}")
    end

    def partB do
      IO.puts("Day 3 Part B Solution")
    end

  end
