defmodule TechTalksWeb.VideoViewTest do
  use TechTalksWeb.ConnCase, async: true
  import Phoenix.View

  test "renders index.html", %{conn: conn} do
    videos = [
      %TechTalks.Multimedia.Video{id: "1", title: "dogs"},
      %TechTalks.Multimedia.Video{id: "2", title: "cats"}
    ]

    content =
      render_to_string(
        TechTalksWeb.VideoView,
        "index.html",
        conn: conn,
        videos: videos
      )

    assert String.contains?(content, "Listing Videos")

    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end

  test "renders new.html", %{conn: conn} do
    # owner = %TechTalks.Accounts.User{}
    changeset = TechTalks.Multimedia.change_video(%TechTalks.Multimedia.Video{})
    categories = [%TechTalks.Multimedia.Category{id: 123, name: "cats"}]

    content =
      render_to_string(TechTalksWeb.VideoView, "new.html",
        conn: conn,
        changeset: changeset,
        categories: categories
      )

    assert String.contains?(content, "New Video")
  end
end
