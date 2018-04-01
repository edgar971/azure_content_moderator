defmodule AzureCM.ResponseFormatter do
  @moduledoc """
  Provides helper functions to normalize and simplify HTTP Responses received
  from the Azure API
  """
  def format_response({:ok, %{body: {:ok, message}, status_code: code}}) when code == 401,
    do: {:error, message}

  def format_response({:ok, %{body: {:ok, %{"Errors" => errors}}}}) do
    {:error, errors}
  end

  def format_response({:ok, %{body: body}}), do: body

  def format_response({:error, error}), do: {:error, error}
end
