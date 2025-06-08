defmodule Solutions.Day3 do

  def partA() do
    lines = File.read!("data/3_input.txt")
      |> String.split("\n", trim: true)

    lines
      |> Enum.map(&String.duplicate(&1, Enum.count(lines)))
      |> Enum.with_index()
      |> Enum.count(&is_tree(&1, 3))
      |> IO.inspect()
  end

  def partB() do
    lines = File.read!("data/3_input.txt")
      |> String.split("\n", trim: true)

    line_count = Enum.count(lines)

    [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]] |> Enum.map(
      fn [right, down] -> lines
        |> Enum.map(&String.duplicate(&1, line_count))
        |> Enum.take_every(down)
        |> Enum.with_index()
        |> Enum.count(&is_tree(&1, right))
    end)
    |> Enum.reduce(&(&1 * &2))
    |> IO.inspect()
  end

  defp is_tree({input, index}, right) do
    String.at(input, right * index) == "#"
  end

end
