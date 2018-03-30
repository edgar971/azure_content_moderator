defmodule AzureCM.Config do
  def base_api_url do
    Application.fetch_env!(:azure_content_moderator, :content_moderator_url)
  end
end
