defmodule ExpenseApiWeb.HealthController do
  use ExpenseApiWeb, :controller

  def index(conn, _params) do
    json(conn, %{
      status: "ok",
      message: "API de Gestão de Despesas - Funcionando!",
      timestamp: DateTime.utc_now(),
      version: "1.0.0"
    })
  end
end
