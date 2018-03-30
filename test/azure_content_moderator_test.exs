defmodule AzureCMTest do
  use ExUnit.Case
  doctest AzureCM

  test "greets the world" do
    assert AzureCM.hello() == :world
  end
end
