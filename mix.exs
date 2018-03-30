defmodule AzureCM.MixProject do
  use Mix.Project

  def project do
    [
      app: :azure_content_moderator,
      version: "0.1.0",
      elixir: "~> 1.6",
      description: description(),
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:httpoison, :logger],
      mod: {AzureCM, []},
      env: [
        content_moderator_url: "https://westus.api.cognitive.microsoft.com/contentmoderator/moderate/v1.0/"
      ]
    ]
  end

  defp description do
    """
    Azure Content Moderator API Wrapper written in Elixir.
    """
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/edgar971/azure_content_moderator"
      },
      maintainers: [
        "edgar971"
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mock, "~> 0.3.0", only: :test},
      {:httpoison, "~> 1.0"},
      {:json, "~> 1.0"}
    ]
  end
end
