defmodule AzureCM.Config do
  @moduledoc """
  Used to fetch Configuration variables
  """
  
  def base_api_url do
    Application.fetch_env!(:azure_content_moderator, :content_moderator_url)
  end

  def subscription_key do
    Application.fetch_env!(:azure_content_moderator, :subscription_key)
  end

  def language do
    Application.fetch_env!(:azure_content_moderator, :language)
  end
end
