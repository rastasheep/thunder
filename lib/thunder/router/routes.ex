defmodule Thunder.Router.Routes do

  def routes do
    Enum.map dummy_routes, fn(route) -> Thunder.Router.PathPattern.parse(route) end
  end

  defp dummy_routes do
    [
      "/pages/home",
      "/albums/new",
      "/albums/:id",
      "/albums/:id/edit",
      "/albums/:album_id/photos/:id",
      "/albums/:album_id/photos/:id/edit"
    ]
  end

end
