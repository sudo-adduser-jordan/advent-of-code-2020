defmodule Mix.Tasks.Codegen do
  use Mix.Task

  @shortdoc "Generates code files for Advent of Code"

  def run(_args) do
    # Ensure the application is started
    Mix.Task.run("app.start")
    AOC.CodeGen.run()
    # IO.puts("hello")
  end

end
