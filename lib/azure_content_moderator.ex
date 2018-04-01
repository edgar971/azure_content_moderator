defmodule AzureCM do
  use Application
  use Supervisor

  alias AzureCM.OCRAPI
  alias AzureCM.ResponseFormatter
  alias AzureCM.Config

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
  Returns any text found in the image given a `image_url`. 

  ## Example
      iex> AzureCM.ocr("https://moderatorsampleimages.blob.core.windows.net/samples/sample.jpg")
      {:ok, %{"Candidates" => [], "Language" => "...", "Metadata" => [], "Status" => %{}, "Text" => "...", "TrackingId" => "..."}}
  """
  def ocr(image_url) do
    {:ok, body} =
      %{
        "DataRepresentation" => "URL",
        "Value" => image_url
      }
      |> JSON.encode()

    headers =
      []
      |> add_json_header
      |> add_subscription_token_header

    params = ocr_params()

    ~s(/ProcessImage/OCR)
    |> OCRAPI.post(body, headers, params: params)
    |> ResponseFormatter.format_response()
  end

  defp ocr_params(params \\ []) do
    params ++ [language: Config.language()]
  end

  defp add_json_header(headers), do: headers ++ [{"Content-Type", "application/json"}]

  defp add_subscription_token_header(headers),
    do: headers ++ [{"Ocp-Apim-Subscription-Key", Config.subscription_key()}]
end
