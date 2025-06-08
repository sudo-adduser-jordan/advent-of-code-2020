defmodule E.File do

  def file_to_map(file_name) do
    file_name
      |> File.stream!()
      |> Enum.map(&String.trim_trailing/1)
  end

  def parse_grid(lines) do
    for {line, y} <- Enum.with_index(lines, 1),
        {char, x} <- Enum.with_index(String.graphemes(line), 1),
        char == "#",
        do: {x, y},
        into: MapSet.new()
  end

end
