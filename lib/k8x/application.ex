defmodule K8x.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      K8xWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: K8x.PubSub},
      # Start Finch
      {Finch, name: K8x.Finch},
      # Start the Endpoint (http/https)
      K8xWeb.Endpoint
      # Start a worker by calling: K8x.Worker.start_link(arg)
      # {K8x.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: K8x.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    K8xWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
