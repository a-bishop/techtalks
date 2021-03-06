# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :techtalks,
  ecto_repos: [Techtalks.Repo]

# Configures the endpoint
config :techtalks, TechtalksWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7zkz0w6Wdkb+pCeb/dcZiNBDGGhwtC9o5ClvwOplkaGKJnLYV8AdpsiLxHYt7yGs",
  render_errors: [view: TechtalksWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Techtalks.PubSub,
  live_view: [signing_salt: "ZapA9fsV"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
