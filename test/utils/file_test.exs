defmodule AzureCM.FileTest do
  use ExUnit.Case

  alias AzureCM.File

  describe "mime_type" do
    test "jpeg" do
      assert File.mime_type("image.jpeg") == "image/jpeg"
    end

    test "jpg" do
      assert File.mime_type("image.jpg") == "image/jpeg"
    end

    test "png" do
      assert File.mime_type("image.png") == "image/png"
    end

    test "gif" do
      assert File.mime_type("image.gif") == "image/gif"
    end
  end
end
