defmodule TechtalksWeb.WatchView do
  use TechtalksWeb, :view

  def player_id(video) do
    ~r{^.*(?:youtu\.be/|\w+/|v=)(?<id>[^#&?]*)}
    |> Regex.named_captures(video.url)
    |> get_in(["id"])
  end
end
