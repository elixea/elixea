defmodule Elixea.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixea,
      description: "Elixir is not just functional programming ...",
      version: "1.1.2",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    []
  end
end
