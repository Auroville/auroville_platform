use Mix.Config

# Configure your database
config :kinisi, Kinisi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "kinisi_dev",
  hostname: "localhost",
  pool_size: 10
