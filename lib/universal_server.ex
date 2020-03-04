defmodule UniversalServer do
  @moduledoc """
  Documentation for `UniversalServer`.
  """

  @doc """
  Spawn a universal server.
  """
  def spawn do
    spawn(&UniversalServer.wait_to_become_a_server/0)
  end

  @doc """
  Wait to become a server.
  """
  def wait_to_become_a_server() do
    receive do
      {:become, fun} ->
        fun.()
    end
  end
end
