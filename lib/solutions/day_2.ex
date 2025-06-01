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

      result = "data/2_input.txt"
        |> File.stream!()
        |> Stream.map(&String.trim/1)
        |> Stream.map(&String.split(&1, " "))
        |> Enum.count(fn [positions, letter, password] ->
          [position_one, position_two] = positions
            |> String.split("-")
            |> Enum.map(&String.to_integer/1)
            |> Enum.map(fn x -> x - 1 end)
          letter = String.replace(letter, ":", "")
          password |> String.at(position_one) != letter
          and
          password |> String.at(position_two) == letter
          or
          password |> String.at(position_one) == letter
          and
          password |> String.at(position_two) != letter
        end)

        IO.puts("Result: #{result}")
    end

  end
