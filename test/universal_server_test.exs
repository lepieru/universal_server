defmodule UniversalServerTest do
  use ExUnit.Case
  doctest UniversalServer

  test "greets the world" do
    assert UniversalServer.hello() == :world
  end
end
