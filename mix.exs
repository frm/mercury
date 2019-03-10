defmodule Mercury.MixProject do
  use Mix.Project

  @env Mix.env()

  def project do
    [
      app: :mercury,
      version: "0.1.0",
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Mercury.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:absinthe, "~> 1.4.0"},
      {:absinthe_plug, "~> 1.4.0"},
      {:absinthe_ecto, "~> 0.1.3"},
      {:ecto_sql, "~> 3.0"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:phoenix, "~> 1.4.1"},
      {:phoenix_ecto, "~> 4.0"},
      {:phoenix_pubsub, "~> 1.1"},
      {:plug_cowboy, "~> 2.0"},
      {:poison, "~> 3.1"},
      {:postgrex, ">= 0.0.0"}
    ] ++ deps(@env)
  end

  defp deps(env) when env in [:dev, :test] do
    [
      {:credo, "~> 1.0.0", runtime: false},
      {:ex_machina, "~> 2.2"},
      {:faker, "~> 0.11"}
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
