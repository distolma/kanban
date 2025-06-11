defmodule Kanban.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :title, :string
      add :description, :text
      add :position, :integer
      add :due_date, :utc_datetime
      add :column_id, references(:columns, on_delete: :nothing)
      add :assignee_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:cards, [:column_id])
    create index(:cards, [:assignee_id])
  end
end
