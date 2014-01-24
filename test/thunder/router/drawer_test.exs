defmodule Thunder.Router.DrawerTest do
  use ExUnit.Case

  defmodule ResourcesRoutesTest do
    use Thunder.Router.Drawer

    draw resources(:albums)
      |> resources(:photos)
  end

  test "resources routes" do
    expected_routes =
      [[method: "GET", path: "/albums", controller: :Elixir.AlbumsController, action: :index],
      [method: "GET", path: "/albums/new", controller: :Elixir.AlbumsController, action: :new],
      [method: "POST", path: "/albums", controller: :Elixir.AlbumsController, action: :create],
      [method: "GET", path: "/albums/:id", controller: :Elixir.AlbumsController, action: :show],
      [method: "GET", path: "/albums/:id/edit", controller: :Elixir.AlbumsController, action: :edit],
      [method: "PUT", path: "/albums/:id", controller: :Elixir.AlbumsController, action: :update],
      [method: "DELETE", path: "/albums/:id", controller: :Elixir.AlbumsController, action: :destroy],
      [method: "GET", path: "/photos", controller: :Elixir.PhotosController, action: :index],
      [method: "GET", path: "/photos/new", controller: :Elixir.PhotosController, action: :new],
      [method: "POST", path: "/photos", controller: :Elixir.PhotosController, action: :create],
      [method: "GET", path: "/photos/:id", controller: :Elixir.PhotosController, action: :show],
      [method: "GET", path: "/photos/:id/edit", controller: :Elixir.PhotosController, action: :edit],
      [method: "PUT", path: "/photos/:id", controller: :Elixir.PhotosController, action: :update],
      [method: "DELETE", path: "/photos/:id", controller: :Elixir.PhotosController, action: :destroy]]

    assert ResourcesRoutesTest.all == expected_routes
  end

  defmodule SingleRouteTest do
    use Thunder.Router.Drawer

    draw get("/", [to: "pages#index"])
  end

  test "single route" do
    expected_routes = [[method: "GET", path: "/", controller: :Elixir.PagesController, action: :index]]

    assert SingleRouteTest.all == expected_routes
  end

  defmodule SecondSingleRouteTest do
    use Thunder.Router.Drawer

    draw get("/", [to: "pages#index"])
      |> get("/contact", [to: "pages#contact"])
  end

  test "second single route" do
    expected_routes = [[method: "GET", path: "/", controller: :Elixir.PagesController, action: :index]]

    assert SingleRouteTest.all == expected_routes
  end

end
