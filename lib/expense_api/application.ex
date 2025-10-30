defmodule ExpenseApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ExpenseApiWeb.Telemetry,
      ExpenseApi.Repo,
      {DNSCluster, query: Application.get_env(:expense_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ExpenseApi.PubSub},
      # Start a worker by calling: ExpenseApi.Worker.start_link(arg)
      # {ExpenseApi.Worker, arg},
      # Start to serve requests, typically the last entry
      ExpenseApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExpenseApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ExpenseApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
