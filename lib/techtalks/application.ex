defmodule Techtalks.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Techtalks.Repo,
      # Start the Telemetry supervisor
      TechtalksWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Techtalks.PubSub},
      # Start the Endpoint (http/https)
      TechtalksWeb.Endpoint,
      # Start a worker by calling: Techtalks.Worker.start_link(arg)
      # {Techtalks.Worker, arg}
      TechtalksWeb.Presence
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Techtalks.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TechtalksWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
