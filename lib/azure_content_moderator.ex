defmodule AzureCM do
  use Application
  use Supervisor

  @moduledoc """
  Provides API wrappers for the Azure Content Moderator API.
  See: https://docs.microsoft.com/en-us/azure/cognitive-services/Content-Moderator/api-reference
  """

  @doc "Start hook"
  def start(_type, _args) do
    start_link([])
  end

  @doc "Supervisor start"
  def start_link(_) do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = []

    supervise(children, strategy: :one_for_one)
  end

  @doc """
  Hello world.

  ## Examples

      iex> AzureCM.hello
      :world

  """
  def hello do
    :world
  end
end
