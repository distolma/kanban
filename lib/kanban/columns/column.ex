defmodule Kanban.Columns.Column do
  use Ecto.Schema
  import Ecto.Changeset

  schema "columns" do
    field :title, :string
    field :order, :integer, default: 0

    belongs_to :board, Kanban.Boards.Board
    has_many :cards, Kanban.Cards.Card

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(column, attrs) do
    column
    |> cast(attrs, [:title, :order])
    |> validate_required([:title, :order])
    |> assoc_constraint(:board)
  end
end
