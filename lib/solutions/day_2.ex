  defmodule Solutions.Day2 do

    def partA do
      IO.puts("| Day 2 | Part A | Solution \n")

      result = "data/2_input.txt"
        |> File.stream!()
        |> Stream.map(&String.trim/1)
        |> Stream.map(&String.split(&1, " "))
        |> Enum.count(fn [count, letter, password] ->
          [min, max] = count
            |> String.split("-")
            |> Enum.map(&String.to_integer/1)
          count_in_password = String.graphemes(password)
            |> Enum.count(&(&1 == String.replace(letter, ":", "")))
          count_in_password >= min and count_in_password <= max
        end)

        IO.puts("Result: #{result}")
      end

    def partB do
      IO.puts("| Day 2 | Part B | Solution \n")

      result = "data/2_sample.txt"
        |> File.stream!()
        |> Stream.map(&String.trim/1)
        |> Stream.map(&String.split(&1, " "))
        |> Enum.count(fn [count, letter, password] ->
          [min, max] = count
            |> String.split("-")
            |> Enum.map(&String.to_integer/1)
          count_in_password = String.graphemes(password)
            |> Enum.count(&(&1 == String.replace(letter, ":", "")))
          count_in_password >= min and count_in_password <= max
        end)

        IO.puts("Result: #{result}")
    end

  end
