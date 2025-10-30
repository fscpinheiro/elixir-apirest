defmodule ExpenseApi.Repo do
  use Ecto.Repo,
    otp_app: :expense_api,
    adapter: Ecto.Adapters.Postgres
end
