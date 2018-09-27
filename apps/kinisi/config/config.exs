use Mix.Config

config :kinisi, ecto_repos: [Kinisi.Repo]

import_config "#{Mix.env}.exs"
