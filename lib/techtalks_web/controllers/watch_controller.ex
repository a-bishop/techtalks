defmodule TechTalksWeb.WatchController do
  use TechTalksWeb, :controller
  alias TechTalks.Multimedia

  def show(conn, %{"id" => id}) do
    video = Multimedia.get_video!(id)
    render(conn, "show.html", video: video)
  end
end
