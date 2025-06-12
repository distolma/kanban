defmodule Kanban.CardsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Kanban.Cards` context.
  """

  @doc """
  Generate a card.
  """
  def card_fixture(attrs \\ %{}) do
    {:ok, card} =
      attrs
      |> Enum.into(%{
        done: true,
        order: 42,
        title: "some title"
      })
      |> Kanban.Cards.create_card()

    card
  end
end
