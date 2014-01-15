defmodule Thunder.Router.DrawerTest do
  use ExUnit.Case

  defmodule ResourcesRoutesTest do
    use Thunder.Router.Drawer

    draw resources(:albums)
      |> resources(:photos)
  end

  test "resources routes" do
    expected_routes =
      [[method: "GET", path: "/albums", controller: :albums, action: :index],
      [method: "GET", path: "/albums/new", controller: :albums, action: :new],
      [method: "POST", path: "/albums", controller: :albums, action: :create],
      [method: "GET", path: "/albums/:id", controller: :albums, action: :show],
      [method: "GET", path: "/albums/:id/edit", controller: :albums, action: :edit],
      [method: "PUT", path: "/albums/:id", controller: :albums, action: :update],
      [method: "DELETE", path: "/albums/:id", controller: :albums, action: :destroy],
      [method: "GET", path: "/photos", controller: :photos, action: :index],
      [method: "GET", path: "/photos/new", controller: :photos, action: :new],
      [method: "POST", path: "/photos", controller: :photos, action: :create],
      [method: "GET", path: "/photos/:id", controller: :photos, action: :show],
      [method: "GET", path: "/photos/:id/edit", controller: :photos, action: :edit],
      [method: "PUT", path: "/photos/:id", controller: :photos, action: :update],
      [method: "DELETE", path: "/photos/:id", controller: :photos, action: :destroy]]

    assert ResourcesRoutesTest.all == expected_routes
  end

end
