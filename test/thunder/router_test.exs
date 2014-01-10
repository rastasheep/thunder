defmodule Thunder.RouterTest do
  use ExUnit.Case

  test "no segments" do
    path = ""

    assert Thunder.Router.parse(path) == []
  end

  test "no segments just slash" do
    path = "/"

    assert Thunder.Router.parse(path) == []
  end

  test "no segments just two slashes" do
    path = "//"

    assert Thunder.Router.parse(path) == []
  end

  test "two segments" do
    path = "/albums/123"

    assert Thunder.Router.parse(path) == ["albums", "123"]
  end

  test "two segments without leading slash" do
    path = "albums/123"

    assert Thunder.Router.parse(path) == ["albums", "123"]
  end

  test "two segments with traling slash" do
    path = "/albums/123/"

    assert Thunder.Router.parse(path) == ["albums", "123"]
  end

end
