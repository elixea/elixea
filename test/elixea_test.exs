defmodule ElixeaTest do
  use ExUnit.Case
  doctest Elixea

  test "greets the world" do
    assert Elixea.hello() == :world
  end
end
