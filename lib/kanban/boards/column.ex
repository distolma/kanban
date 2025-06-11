defmodule Kanban.Boards.Column do
  use Ecto.Schema
  import Ecto.Changeset

  schema "columns" do
    field :position, :integer
    field :title, :string
    field :board_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(column, attrs) do
    column
    |> cast(attrs, [:title, :position])
    |> validate_required([:title, :position])
  end
end
