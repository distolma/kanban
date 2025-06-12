defmodule Kanban.Repo.Migrations.CreateColumns do
  use Ecto.Migration

  def change do
    create table(:columns) do
      add :title, :string
      add :order, :integer
      add :board_id, references(:boards, on_delete: :delete_all), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:columns, [:board_id])
  end
end
