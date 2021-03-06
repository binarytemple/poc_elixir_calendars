defmodule PocElixirCalendars.Mixfile do
  use Mix.Project

  def project do
    [
      app: :poc_elixir_calendars,
      version: "0.0.1",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      escript: escript
			
     ]
  end

  def escript do
		[
			main_module: PocElixirCalendars,
			appplications: [
				:logger, :tzdata, :calendar
			]
		]
  end
	
  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
			applications: [
				:logger, :tzdata, :calendar
			]
		]
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
    {:calendar, "~> 0.14.2"},  
    {:tzdata, "~> 0.1.7"},
    {:exrm, "~> 1.0.8"},
    {:ex_doc, ">= 0.0.0", only: :dev} 
  ]
  end
end
