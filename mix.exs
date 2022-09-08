defmodule Terminal.MixProject do
  use Mix.Project

  def project do
    [
      app: :terminal,
      version: "0.1.0",
      elixir: "1.14.0",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
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

  defp description do
    "Elixir Kino UIs with Reactish API."
  end

  defp package do
    [
      name: :terminal,
      files: ["lib", "test", "mix.*", "*.exs", "*.md", ".gitignore", "LICENSE"],
      maintainers: ["Samuel Ventura"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/samuelventura/terminal/"}
    ]
  end
end
