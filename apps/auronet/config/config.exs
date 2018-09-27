# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :auronet,
  namespace: Auronet

# Configures the endpoint
config :auronet, AuronetWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cw7xtdkCw9yzpfhsfq8LfsrMPy4rL5AxInllihe5TGg/gAQDl40lRcybpLVi9SHN",
  render_errors: [view: AuronetWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Auronet.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
