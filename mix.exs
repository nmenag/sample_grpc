defmodule SampleGrpc.MixProject do
  use Mix.Project

  def project do
    [
      app: :sample_grpc,
      version: "0.1.0",
      elixir: "~> 1.11-rc",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SampleGrpc.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:grpc, github: "elixir-grpc/grpc"},
      {:cowlib, "~> 2.9.0", override: true}
    ]
  end
end
