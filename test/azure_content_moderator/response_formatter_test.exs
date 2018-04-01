defmodule AzureCM.ResponseFormatterTest do
  use ExUnit.Case, async: false

  alias AzureCM.ResponseFormatter

  describe "format_response" do
    test "success" do
      expected_response = {:ok, "test"}
      response = {:ok, %{body: expected_response}}
      assert ResponseFormatter.format_response(response) == expected_response
    end

    test "error" do
      errors = ["error 1", "error 2"]
      expected_response = {:error, errors}
      response = {:ok, %{body: {:ok, %{"Errors" => errors}}}}
      assert ResponseFormatter.format_response(response) == expected_response
    end

    test "access denied" do
      error_message = "Error with token"
      expected_response = {:error, error_message}
      response = {:ok, %{body: {:ok, error_message}, status_code: 401}}
      assert ResponseFormatter.format_response(response) == expected_response
    end
  end
end
