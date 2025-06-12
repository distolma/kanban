defmodule Kanban.Cards.Card do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cards" do
    field :title, :string
    field :done, :boolean, default: false
    field :order, :integer, default: 0

    belongs_to :column, Kanban.Columns.Column

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:title, :done, :order])
    |> validate_required([:title, :done, :order])
    |> assoc_constraint(:column)
  end
end
