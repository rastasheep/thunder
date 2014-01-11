defmodule Thunder.RouterTest do
  use ExUnit.Case

  require Thunder.Router, as: R

  test "parse_path_pattern /albums" do
    path = "/albums"

    assert R.parse_path_pattern(path) == [segment: "albums"]
  end

  test "parse_path_pattern /albums/:id" do
    path = "/albums/:id"

    assert R.parse_path_pattern(path) == [segment: "albums", binding: "id"]
  end

  test "parse_path_pattern /albums/:id/edit" do
    path = "/albums/:id/edit"

    assert R.parse_path_pattern(path) == [segment: "albums", binding: "id", segment: "edit"]
  end

  test "parse_path_pattern /albums/:album_id/photos/:id" do
    path = "/albums/:album_id/photos/:id"

    assert R.parse_path_pattern(path) == [segment: "albums", binding: "album_id",
                                          segment: "photos", binding: "id"]
  end

  test "parse_path_pattern /albums/:album_id/photos/:id/edit" do
    path = "/albums/:album_id/photos/:id/edit"

    assert R.parse_path_pattern(path) == [segment: "albums", binding: "album_id",
                                          segment: "photos", binding: "id", segment: "edit"]
  end

  test "no segments" do
    path = ""

    assert R.parse(path) == []
  end

  test "no segments just slash" do
    path = "/"

    assert R.parse(path) == []
  end

  test "no segments just two slashes" do
    path = "//"

    assert R.parse(path) == []
  end

  test "two segments" do
    path = "/albums/123"

    assert R.parse(path) == ["albums", "123"]
  end

  test "two segments without leading slash" do
    path = "albums/123"

    assert R.parse(path) == ["albums", "123"]
  end

  test "two segments with traling slash" do
    path = "/albums/123/"

    assert R.parse(path) == ["albums", "123"]
  end

end
