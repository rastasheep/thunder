defmodule Thunder.Router.MapperTest do
  use ExUnit.Case

  test "resources_routes" do
    expected_routes =
      [[method: "GET", path: "/albums", controller: :Elixir.AlbumsController, action: :index],
      [method: "GET", path: "/albums/new", controller: :Elixir.AlbumsController, action: :new],
      [method: "POST", path: "/albums", controller: :Elixir.AlbumsController, action: :create],
      [method: "GET", path: "/albums/:id", controller: :Elixir.AlbumsController, action: :show],
      [method: "GET", path: "/albums/:id/edit", controller: :Elixir.AlbumsController, action: :edit],
      [method: "PUT", path: "/albums/:id", controller: :Elixir.AlbumsController, action: :update],
      [method: "DELETE", path: "/albums/:id", controller: :Elixir.AlbumsController, action: :destroy]]

    resource_name = :albums

    assert Thunder.Router.Mapper.resources_routes(resource_name) == expected_routes
  end

  test "get_route" do
    path_pattern = "/index"
    mapping = [to: "pages#index"]

    assert Thunder.Router.Mapper.get_route(path_pattern, mapping) == [[method: "GET", path: "/index", controller: :Elixir.PagesController, action: :index]]
  end

end
