defmodule Kanban.Boards.Card do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cards" do
    field :position, :integer
    field :description, :string
    field :title, :string
    field :due_date, :utc_datetime
    field :column_id, :id
    field :assignee_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:title, :description, :position, :due_date])
    |> validate_required([:title, :description, :position, :due_date])
  end
end
