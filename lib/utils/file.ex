defmodule AzureCM.File do
  @moduledoc """
  File utilities
  """
  @jpeg "image/jpeg"
  @png "image/png"
  @gif "image/gif"
  @bmp "image/bmp"

  def mime_type(filename) do
    case Path.extname(filename) do
      ".jpeg" -> @jpeg
      ".jpg" -> @jpeg
      ".png" -> @png
      ".gif" -> @gif
    end
  end
end
