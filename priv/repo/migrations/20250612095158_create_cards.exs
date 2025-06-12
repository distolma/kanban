defmodule Kanban.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :title, :string
      add :done, :boolean, default: false, null: false
      add :order, :integer
      add :column_id, references(:columns, on_delete: :delete_all), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:cards, [:column_id])
  end
end
