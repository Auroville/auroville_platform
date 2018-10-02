use Mix.Config

config :av_data_store, ecto_repos: [AVDataStore.Repo]

import_config "#{Mix.env}.exs"
