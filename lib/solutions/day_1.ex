  defmodule Solutions.Day1 do

    def partA do
      IO.puts("| Day 1 | Part A | Solution \n")

      numbers =
        "data/1_input.txt"
        |> File.read!()
        |> String.split("\n")
        |> Enum.map(&String.to_integer/1)

      pairs = for a <- numbers, b <- numbers, a < b, do: {a, b}

      {a, b} = Enum.filter(pairs, fn {a, b} -> a + b == 2020 end)
        |> List.first()

      IO.puts("Result #{a * b}")
    end

    def partB do
      IO.puts("| Day 1 | Part B | Solution \n")

      numbers =
        "data/1_input.txt"
        |> File.read!()
        |> String.split("\n")
        |> Enum.map(&String.to_integer/1)

        combinations = for a <- numbers,
                           b <- numbers,
                           c <- numbers,
                           a < b,
                           b < c,
                           do: {a, b, c}

      {a, b, c} = Enum.filter(combinations, fn {a, b, c} -> a + b + c == 2020 end)
        |> List.first()

      IO.puts("Result #{a * b * c}")
    end

  end
