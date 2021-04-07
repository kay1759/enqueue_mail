defmodule EnqueueMail.MixProject do
  use Mix.Project

  @description"""
  This library provides enqueueing mail to MailQueue in Elixir.
  """
  
  def project do
    [
      app: :enqueue_mail,
      version: "0.1.1",
      elixir: "~> 1.8",
      description: @description,
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def package do
    [
      maintainers: ["Katsuyoshi Yabe"],
      licenses: ["MIT"],
      links: %{ "Github": "https://github.com/kay1759/enqueue_mail" }
    ]
  end
  
  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {EnqueueMail.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:amqp, "~> 1.1"},
      {:exprotobuf, "~> 1.2.9"},
      {:ex_doc, "~> 0.19.3", only: :dev},
      {:credo, "~> 1.0", only: [:dev, :test], runtime: false}
    ]
  end
end
