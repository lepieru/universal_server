defmodule UniversalServerTest do
  use ExUnit.Case
  doctest UniversalServer

  test "become a factorial server" do
    server = UniversalServer.spawn()
    send(server, {:become, &factorial_server/0})

    send(server, {self(), 0})
    assert_receive 1

    send(server, {self(), 5})
    assert_receive 120

    send(server, {self(), 10})
    assert_receive 3_628_800
  end

  defp factorial_server do
    receive do
      {from, n} ->
        send(from, factorial(n))
        factorial_server()
    end
  end

  defp factorial(0), do: 1
  defp factorial(n), do: n * factorial(n - 1)
end
