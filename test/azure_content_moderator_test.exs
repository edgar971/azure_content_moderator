defmodule AzureCMTest do
  use ExUnit.Case, async: false

  import Mock

  alias AzureCM.APIMock

  setup do
    [
      text: "IF WE DID \r\nALL \r\nTHE THINGS \r\nWE ARE \r\nCAPABLE \r\nOF DOING, \r\nWE WOULD \r\nLITERALLY \r\nASTOUND \r\nOURSELVE \r\n"
    ]
  end

  describe "OCR" do
    test "success", %{text: text} do
      with_mock :hackney, APIMock.mock_options(fn _ -> APIMock.ocr(:success_with_image_url) end) do
        assert {:ok, result} = AzureCM.ocr("http://via.placeholder.com/350x150?text=An%20Elixir%20Test")
        assert result["Text"] == text
      end
    end
  end
end
