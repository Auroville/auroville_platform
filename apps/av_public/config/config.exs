# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :av_public,
  namespace: AVPublic

# Configures the endpoint
config :av_public, AVPublicWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DfVkF6x44zcbXRjJy7FF9w+lm8FZk2vFPxcaOgnDlUCVyx+orabrXWQ9yfUYSY2S",
  render_errors: [view: AVPublicWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AVPublic.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :av_public, :generators,
 context_app: :av_data_store

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
