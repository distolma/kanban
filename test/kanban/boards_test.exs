defmodule Kanban.BoardsTest do
  use Kanban.DataCase

  alias Kanban.Boards

  describe "boards" do
    alias Kanban.Boards.Board

    import Kanban.BoardsFixtures

    @invalid_attrs %{name: nil, description: nil}

    test "list_boards/0 returns all boards" do
      board = board_fixture()
      assert Boards.list_boards() == [board]
    end

    test "get_board!/1 returns the board with given id" do
      board = board_fixture()
      assert Boards.get_board!(board.id) == board
    end

    test "create_board/1 with valid data creates a board" do
      valid_attrs = %{name: "some name", description: "some description"}

      assert {:ok, %Board{} = board} = Boards.create_board(valid_attrs)
      assert board.name == "some name"
      assert board.description == "some description"
    end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Boards.create_board(@invalid_attrs)
    end

    test "update_board/2 with valid data updates the board" do
      board = board_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description"}

      assert {:ok, %Board{} = board} = Boards.update_board(board, update_attrs)
      assert board.name == "some updated name"
      assert board.description == "some updated description"
    end

    test "update_board/2 with invalid data returns error changeset" do
      board = board_fixture()
      assert {:error, %Ecto.Changeset{}} = Boards.update_board(board, @invalid_attrs)
      assert board == Boards.get_board!(board.id)
    end

    test "delete_board/1 deletes the board" do
      board = board_fixture()
      assert {:ok, %Board{}} = Boards.delete_board(board)
      assert_raise Ecto.NoResultsError, fn -> Boards.get_board!(board.id) end
    end

    test "change_board/1 returns a board changeset" do
      board = board_fixture()
      assert %Ecto.Changeset{} = Boards.change_board(board)
    end
  end

  describe "columns" do
    alias Kanban.Boards.Column

    import Kanban.BoardsFixtures

    @invalid_attrs %{position: nil, title: nil}

    test "list_columns/0 returns all columns" do
      column = column_fixture()
      assert Boards.list_columns() == [column]
    end

    test "get_column!/1 returns the column with given id" do
      column = column_fixture()
      assert Boards.get_column!(column.id) == column
    end

    test "create_column/1 with valid data creates a column" do
      valid_attrs = %{position: 42, title: "some title"}

      assert {:ok, %Column{} = column} = Boards.create_column(valid_attrs)
      assert column.position == 42
      assert column.title == "some title"
    end

    test "create_column/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Boards.create_column(@invalid_attrs)
    end

    test "update_column/2 with valid data updates the column" do
      column = column_fixture()
      update_attrs = %{position: 43, title: "some updated title"}

      assert {:ok, %Column{} = column} = Boards.update_column(column, update_attrs)
      assert column.position == 43
      assert column.title == "some updated title"
    end

    test "update_column/2 with invalid data returns error changeset" do
      column = column_fixture()
      assert {:error, %Ecto.Changeset{}} = Boards.update_column(column, @invalid_attrs)
      assert column == Boards.get_column!(column.id)
    end

    test "delete_column/1 deletes the column" do
      column = column_fixture()
      assert {:ok, %Column{}} = Boards.delete_column(column)
      assert_raise Ecto.NoResultsError, fn -> Boards.get_column!(column.id) end
    end

    test "change_column/1 returns a column changeset" do
      column = column_fixture()
      assert %Ecto.Changeset{} = Boards.change_column(column)
    end
  end

  describe "cards" do
    alias Kanban.Boards.Card

    import Kanban.BoardsFixtures

    @invalid_attrs %{position: nil, description: nil, title: nil, due_date: nil}

    test "list_cards/0 returns all cards" do
      card = card_fixture()
      assert Boards.list_cards() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert Boards.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      valid_attrs = %{position: 42, description: "some description", title: "some title", due_date: ~U[2025-06-10 15:19:00Z]}

      assert {:ok, %Card{} = card} = Boards.create_card(valid_attrs)
      assert card.position == 42
      assert card.description == "some description"
      assert card.title == "some title"
      assert card.due_date == ~U[2025-06-10 15:19:00Z]
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Boards.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      update_attrs = %{position: 43, description: "some updated description", title: "some updated title", due_date: ~U[2025-06-11 15:19:00Z]}

      assert {:ok, %Card{} = card} = Boards.update_card(card, update_attrs)
      assert card.position == 43
      assert card.description == "some updated description"
      assert card.title == "some updated title"
      assert card.due_date == ~U[2025-06-11 15:19:00Z]
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Boards.update_card(card, @invalid_attrs)
      assert card == Boards.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Boards.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Boards.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Boards.change_card(card)
    end
  end

  describe "boards" do
    alias Kanban.Boards.Board

    import Kanban.BoardsFixtures

    @invalid_attrs %{title: nil}

    test "list_boards/0 returns all boards" do
      board = board_fixture()
      assert Boards.list_boards() == [board]
    end

    test "get_board!/1 returns the board with given id" do
      board = board_fixture()
      assert Boards.get_board!(board.id) == board
    end

    test "create_board/1 with valid data creates a board" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Board{} = board} = Boards.create_board(valid_attrs)
      assert board.title == "some title"
    end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Boards.create_board(@invalid_attrs)
    end

    test "update_board/2 with valid data updates the board" do
      board = board_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Board{} = board} = Boards.update_board(board, update_attrs)
      assert board.title == "some updated title"
    end

    test "update_board/2 with invalid data returns error changeset" do
      board = board_fixture()
      assert {:error, %Ecto.Changeset{}} = Boards.update_board(board, @invalid_attrs)
      assert board == Boards.get_board!(board.id)
    end

    test "delete_board/1 deletes the board" do
      board = board_fixture()
      assert {:ok, %Board{}} = Boards.delete_board(board)
      assert_raise Ecto.NoResultsError, fn -> Boards.get_board!(board.id) end
    end

    test "change_board/1 returns a board changeset" do
      board = board_fixture()
      assert %Ecto.Changeset{} = Boards.change_board(board)
    end
  end
end
