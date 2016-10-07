defmodule ExMicrosoftAzure.Mixfile do
  use Mix.Project

  def project do
    [app: :ex_microsoft_azure,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :oauth2]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:oauth2, "~> 0.7"},
      {:poison, "~> 2.2"},
      {:joken, "~> 1.3"},
      {:ex_crypto, "~> 0.1.1"},
      {:ex_doc, "~> 0.14.1", only: :dev}
    ]
  end
end
