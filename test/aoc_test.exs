defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

  test "Main" do
    assert AOC.run() == "true"
  end


end
