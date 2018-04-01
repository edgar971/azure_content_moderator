defmodule AzureCM.OCRAPI do
  @moduledoc false

  use HTTPoison.Base

  alias AzureCM.Config

  def process_url(url), do: Config.base_api_url() <> url

  def process_response_body(body) do
    body
    |> JSON.decode()
  end

end
