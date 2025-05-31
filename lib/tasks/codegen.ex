defmodule Mix.Tasks.Codegen do
  use Mix.Task

  @shortdoc "Generates code files for Advent of Code"

  def run(_args) do
    Mix.Task.run("app.start")
    AOC.CodeGen.run()
  end

end
