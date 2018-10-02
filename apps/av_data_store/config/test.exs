use Mix.Config

# Configure your database
config :av_data_store, AVDataStore.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "av_data_store_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
