defmodule AzureCM.APIMock do
  def ocr(:success_with_image_url) do
    JSON.encode(%{
      "Candidates" => [],
      "Language" => "eng",
      "Metadata" => [
        %{"Key" => "ImageDownloadTimeInMs", "Value" => "831"},
        %{"Key" => "ImageSizeInBytes", "Value" => "273405"}
      ],
      "Status" => %{"Code" => 3000, "Description" => "OK", "Exception" => nil},
      "Text" =>
        "IF WE DID \r\nALL \r\nTHE THINGS \r\nWE ARE \r\nCAPABLE \r\nOF DOING, \r\nWE WOULD \r\nLITERALLY \r\nASTOUND \r\nOURSELVE \r\n",
      "TrackingId" =>
        "123423343434343"
    })
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
