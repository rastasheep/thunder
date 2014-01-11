defmodule Thunder.RouterTest do
  use ExUnit.Case

  require Thunder.Router, as: R

  test "match / <=> /" do
    path = R.parse_path_pattern("/")
    path_pattern = R.parse_path_pattern("/")

    assert R.match(path, path_pattern) == true
  end

  test "match /albums <=> /albums" do
    path = R.parse_path_pattern("/albums")
    path_pattern = R.parse_path_pattern("/albums")

    assert R.match(path, path_pattern) == true
  end

  test "match /albums/new <=> /albums/new" do
    path = R.parse_path_pattern("/albums/new")
    path_pattern = R.parse_path_pattern("/albums/new")

    assert R.match(path, path_pattern) == true
  end

  test "match /albums/12 <=> /albums/:id" do
    path = R.parse_path_pattern("/albums/new")
    path_pattern = R.parse_path_pattern("/albums/:id")

    assert R.match(path, path_pattern) == true
  end

  test "match /albums/12/edit <=> /albums/:id/edit" do
    path = R.parse_path_pattern("/albums/12/edit")
    path_pattern = R.parse_path_pattern("/albums/:id/edit")

    assert R.match(path, path_pattern) == true
  end

  test "match /albums/12/edit <=> /albums" do
    path = R.parse_path_pattern("/albums/12/edit")
    path_pattern = R.parse_path_pattern("/albums")

    assert R.match(path, path_pattern) == false
  end

  test "match /albums <=> /albums/:id/edit" do
    path = R.parse_path_pattern("/albums")
    path_pattern = R.parse_path_pattern("/albums/:id/edit")

    assert R.match(path, path_pattern) == false
  end

  test "match /albums/12/photos/1 <=> /albums/:album_id/photos/:id" do
    path = R.parse_path_pattern("/albums/12/photos/1")
    path_pattern = R.parse_path_pattern("/albums/:album_id/photos/:id")

    assert R.match(path, path_pattern) == true
  end

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

  test "parse no segments" do
    path = ""

    assert R.parse(path) == []
  end

  test "parse no segments just slash" do
    path = "/"

    assert R.parse(path) == []
  end

  test "parse no segments just two slashes" do
    path = "//"

    assert R.parse(path) == []
  end

  test "parse two segments" do
    path = "/albums/123"

    assert R.parse(path) == ["albums", "123"]
  end

  test "parse two segments without leading slash" do
    path = "albums/123"

    assert R.parse(path) == ["albums", "123"]
  end

  test "parse two segments with traling slash" do
    path = "/albums/123/"

    assert R.parse(path) == ["albums", "123"]
  end

end
