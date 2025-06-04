  defmodule Solutions.Day3 do

    def partA do
      IO.puts("| Day 3 | Part A | Solution \n")

      result = "data/2_input.txt"
        |> File.stream!()
        |> Stream.map(&String.trim/1)
        |> Stream.map(&String.split(&1, " "))

        IO.puts("Result: #{result}")
    end

    def partB do
      IO.puts("Day 3 Part B Solution")
    end

  end
