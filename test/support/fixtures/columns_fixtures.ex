defmodule Kanban.ColumnsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Kanban.Columns` context.
  """

  @doc """
  Generate a column.
  """
  def column_fixture(attrs \\ %{}) do
    {:ok, column} =
      attrs
      |> Enum.into(%{
        order: 42,
        title: "some title"
      })
      |> Kanban.Columns.create_column()

    column
  end

  @doc """
  Generate a board.
  """
  def board_fixture(attrs \\ %{}) do
    {:ok, board} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Kanban.Columns.create_board()

    board
  end
end
