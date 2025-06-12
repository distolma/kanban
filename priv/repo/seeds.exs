# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Kanban.Repo.insert!(%Kanban.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Kanban.Repo
alias Kanban.Boards.Board
alias Kanban.Columns.Column
alias Kanban.Cards.Card

if Mix.env() == :dev do
  board_1 = %Board{title: "Hogwarts Kanban of Witchcraft & Wizardry"} |> Repo.insert!()
  column_1 = %Column{title: "First-Years’ To-Do", board: board_1} |> Repo.insert!()

  %Card{
    title: "Buy a new quill; last one turned itself into a ferret.",
    column: column_1
  }
  |> Repo.insert!()

  column_2 =
    %Column{title: "Currently Under a Levitation Charm", board: board_1} |> Repo.insert!()

  %Card{
    title: "Make the coffee mugs Wingardium Leviosa during the daily stand-up.",
    column: column_2
  }
  |> Repo.insert!()

  column_3 = %Column{title: "Keeper of the Done Things", board: board_1} |> Repo.insert!()

  %Card{
    title: "Earn 10 House Points for closing a ticket without breaking prod.",
    column: column_3
  }
  |> Repo.insert!()

  board_2 = %Board{title: "Ministry of Tasks & Magical Bureaucracy"} |> Repo.insert!()
  column_4 = %Column{title: "Unsorted Owls (Inbox 9¾)", board: board_2} |> Repo.insert!()

  %Card{title: "Interrogate owl about the missing postage stamp.", column: column_4}
  |> Repo.insert!()

  column_5 =
    %Column{title: "Auror Investigations (High Priority)", board: board_2} |> Repo.insert!()

  %Card{
    title: "Track down rogue bug calling itself ‘He Who Must Not Be Fixed.’",
    column: column_5
  }
  |> Repo.insert!()

  column_6 = %Column{title: "Locked in Azkaban (Completed)", board: board_2} |> Repo.insert!()

  %Card{title: "File #394, signed, sealed, and Dementor-proofed.", column: column_6}
  |> Repo.insert!()
end
