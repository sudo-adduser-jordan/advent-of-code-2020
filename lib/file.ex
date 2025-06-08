defmodule E.File do

  def file_to_map(file_name) do
    file_name
      |> File.stream!()
      |> Enum.map(&String.trim_trailing/1)
  end
end
