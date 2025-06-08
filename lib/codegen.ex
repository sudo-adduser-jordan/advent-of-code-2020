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
      filename = Path.join(["lib/solutions", "day_#{day}.ex"])
      module_name = "Solutions.Day" <> Integer.to_string(day)
      content = """
        defmodule #{module_name} do

          def partA do
            IO.puts("Day #{day} Part A Solution")
          end

          def partB do
            IO.puts("Day #{day} Part B Solution")
          end

        end
      """
      create_file(filename, content)
    end
  end

  defp create_test_files() do
    for day <- 1..25 do
      filename = Path.join(["test", "day_#{day}.ex"])
      module_name = "AOCTest.Day" <> Integer.to_string(day)
      content = """
        defmodule #{module_name} do
          use ExUnit.Case

          test "A: sample" do
            assert Solutions.Day#{day}.partA() == 69
          end

          test "A: input" do
            assert Solutions.Day#{day}.partA() == 69
          end

          test "B: sample" do
            assert Solutions.Day#{day}.partB() == 69
          end

          test "B: input" do
            assert Solutions.Day#{day}.partB() == 69
          end

        end
      """
      create_file(filename, content)
    end
  end

  defp create_data_files() do
    for day <- 1..25 do
      filename = Path.join(["data", "#{day}_input.txt"])
      filename1 = Path.join(["data", "#{day}_sample.txt"])
      create_file(filename, "")
      create_file(filename1, "")
    end
  end

  def run do
    create_dir("data")
    create_dir("lib/solutions")
    create_data_files()
    create_solution_files()
    create_test_files()
  end
end
