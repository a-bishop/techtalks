# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TechTalks.Repo.insert!(%TechTalks.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TechTalks.Multimedia
alias TechTalks.Accounts

for category <- [
      "Tutorial",
      "Conference Talk"
    ] do
  Multimedia.create_category!(category)
end
