defmodule AOC.CodeGen do
  @content

  defp create_dir(dir) do
    case File.mkdir_p(dir) do
      :ok -> IO.puts("Created directory: #{dir}")
      {:error, reason} -> IO.puts("Failed to create #{dir}: #{reason}")
    end
  end

  defp create_file(filename, content) do
      case File.write(filename, content) do
        :ok -> IO.puts("Created #{filename}")
        {:error, reason} -> IO.puts("Failed to create #{filename}: #{reason}")
      end
  end

  defp create_day_files(parent_dir) do
    for day <- 1..25 do
      filename = Path.join([parent_dir, "day_#{day}.ex"])
      module_name = String.capitalize(parent_dir) <> ".Day" <> Integer.to_string(day)
      content = """
        defmodule #{module_name} do
          def run do
            IO.puts("Day #{day} solution")
          end
        end
      """

      create_file(filename, content)
    end
  end

  def run do
    # create dirs
    # create_dir("libs")
    create_dir("data")
    create_dir("solutions")

    # create files
    dirs = ["data", "solutions"]
    Enum.each(dirs, fn dir ->
      create_day_files(dir)
    end)
  end
end
