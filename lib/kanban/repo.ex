defmodule Kanban.Repo do
  use Ecto.Repo,
    otp_app: :kanban,
    adapter: Ecto.Adapters.SQLite3
end
