defmodule Kanban.Repo.Migrations.CreateBoards do
  use Ecto.Migration

  def change do
    create table(:boards) do
      add :title, :string

      timestamps(type: :utc_datetime)
    end
  end
end
