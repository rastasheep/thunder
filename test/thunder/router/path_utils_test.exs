defmodule Thunder.Router.PathUtilsTest do
  use ExUnit.Case

  require Thunder.Router.PathUtils, as: P

  test "parse no segments" do
    path = ""

    assert P.parse(path) == []
  end

  test "parse no segments just slash" do
    path = "/"

    assert P.parse(path) == []
  end

  test "parse no segments just two slashes" do
    path = "//"

    assert P.parse(path) == []
  end

  test "parse two segments" do
    path = "/albums/123"

    assert P.parse(path) == ["albums", "123"]
  end

  test "parse two segments without leading slash" do
    path = "albums/123"

    assert P.parse(path) == ["albums", "123"]
  end

  test "parse two segments with traling slash" do
    path = "/albums/123/"

    assert P.parse(path) == ["albums", "123"]
  end

end
