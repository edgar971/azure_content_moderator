defmodule AzureCM.APIMock do
  def ocr(:success, :link) do
    "{
      \"Metadata\": [{
        \"Key\": \"ImageDownloadTimeInMs\",
        \"Value\": \"831\"
      }, {
        \"Key\": \"ImageSizeInBytes\",
        \"Value\": \"273405\"
      }],
      \"Language\": \"eng\",
      \"Text\": \"IF WE DID \r\nALL \r\nTHE THINGS \r\nWE ARE \r\nCAPABLE \r\nOF DOING, \r\nWE WOULD \r\nLITERALLY \r\nASTOUND \r\nOURSELVE \r\n\",
      \"Candidates\": [],
      \"Status\": {
        \"Code\": 3000,
        \"Description\": \"OK\",
        \"Exception\": null
      },
      \"TrackingId\": \"USE_ibiza_dd4b8356-3651-42bd-9430-1c9df8071847_ContentModerator.F0_2c4cad83-86e6-41f0-9ba0-ed4662731355\"
    }"
  end

  def mock_options(body_function) do
    [
      request: request(),
      body: body_function
    ]
  end

  defp request do
    fn _method, _url, _headers, _payload, _options ->
      {:ok, nil, nil, nil}
    end
  end
end
