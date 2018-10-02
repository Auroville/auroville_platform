use Mix.Config

config :kinisi, ecto_repos: [AVDataStore.Repo]

import_config "#{Mix.env}.exs"
