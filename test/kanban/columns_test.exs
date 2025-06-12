defmodule Kanban.ColumnsTest do
  use Kanban.DataCase

  alias Kanban.Columns

  describe "columns" do
    alias Kanban.Columns.Column

    import Kanban.ColumnsFixtures

    @invalid_attrs %{title: nil, order: nil}

    test "list_columns/0 returns all columns" do
      column = column_fixture()
      assert Columns.list_columns() == [column]
    end

    test "get_column!/1 returns the column with given id" do
      column = column_fixture()
      assert Columns.get_column!(column.id) == column
    end

    test "create_column/1 with valid data creates a column" do
      valid_attrs = %{title: "some title", order: 42}

      assert {:ok, %Column{} = column} = Columns.create_column(valid_attrs)
      assert column.title == "some title"
      assert column.order == 42
    end

    test "create_column/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Columns.create_column(@invalid_attrs)
    end

    test "update_column/2 with valid data updates the column" do
      column = column_fixture()
      update_attrs = %{title: "some updated title", order: 43}

      assert {:ok, %Column{} = column} = Columns.update_column(column, update_attrs)
      assert column.title == "some updated title"
      assert column.order == 43
    end

    test "update_column/2 with invalid data returns error changeset" do
      column = column_fixture()
      assert {:error, %Ecto.Changeset{}} = Columns.update_column(column, @invalid_attrs)
      assert column == Columns.get_column!(column.id)
    end

    test "delete_column/1 deletes the column" do
      column = column_fixture()
      assert {:ok, %Column{}} = Columns.delete_column(column)
      assert_raise Ecto.NoResultsError, fn -> Columns.get_column!(column.id) end
    end

    test "change_column/1 returns a column changeset" do
      column = column_fixture()
      assert %Ecto.Changeset{} = Columns.change_column(column)
    end
  end

  describe "boards" do
    alias Kanban.Columns.Board

    import Kanban.ColumnsFixtures

    @invalid_attrs %{title: nil}

    test "list_boards/0 returns all boards" do
      board = board_fixture()
      assert Columns.list_boards() == [board]
    end

    test "get_board!/1 returns the board with given id" do
      board = board_fixture()
      assert Columns.get_board!(board.id) == board
    end

    test "create_board/1 with valid data creates a board" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Board{} = board} = Columns.create_board(valid_attrs)
      assert board.title == "some title"
    end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Columns.create_board(@invalid_attrs)
    end

    test "update_board/2 with valid data updates the board" do
      board = board_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Board{} = board} = Columns.update_board(board, update_attrs)
      assert board.title == "some updated title"
    end

    test "update_board/2 with invalid data returns error changeset" do
      board = board_fixture()
      assert {:error, %Ecto.Changeset{}} = Columns.update_board(board, @invalid_attrs)
      assert board == Columns.get_board!(board.id)
    end

    test "delete_board/1 deletes the board" do
      board = board_fixture()
      assert {:ok, %Board{}} = Columns.delete_board(board)
      assert_raise Ecto.NoResultsError, fn -> Columns.get_board!(board.id) end
    end

    test "change_board/1 returns a board changeset" do
      board = board_fixture()
      assert %Ecto.Changeset{} = Columns.change_board(board)
    end
  end
end
