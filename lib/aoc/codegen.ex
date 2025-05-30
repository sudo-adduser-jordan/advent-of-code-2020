defmodule AOC.CodeGen do
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

  defp create_solution_files() do
    for day <- 1..25 do
      filename = Path.join(["solutions", "day_#{day}.ex"])
      module_name = "Solutions.Day" <> Integer.to_string(day)
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

  defp create_data_files() do
    for day <- 1..25 do
      filename = Path.join(["data", "input_#{day}.txt"])
      filename1 = Path.join(["data", "sample_#{day}.txt"])
      create_file(filename, "")
      create_file(filename1, "")
    end
  end

  def run do
    create_dir("data")
    create_dir("solutions")
    create_data_files()
    create_solution_files()
  end
end
