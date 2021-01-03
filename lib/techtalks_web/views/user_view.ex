defmodule TechTalksWeb.UserView do
  use TechTalksWeb, :view
  alias TechTalks.Accounts

  def first_name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
