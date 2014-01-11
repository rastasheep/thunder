defmodule Thunder.RouterTest do
  use ExUnit.Case

  require Thunder.Router, as: R
  require Thunder.Router.Path, as: Path
  require Thunder.Router.PathPattern, as: PathPattern

  test "match / <=> /" do
    path = Path.parse("/")
    path_pattern = PathPattern.parse("/")

    assert R.match(path, path_pattern) == true
  end

  test "match /albums <=> /albums" do
    path = Path.parse("/albums")
    path_pattern = PathPattern.parse("/albums")

    assert R.match(path, path_pattern) == true
  end

  test "match /albums/new <=> /albums/new" do
    path = Path.parse("/albums/new")
    path_pattern = PathPattern.parse("/albums/new")

    assert R.match(path, path_pattern) == true
  end

  test "match /albums/12 <=> /albums/:id" do
    path = Path.parse("/albums/new")
    path_pattern = PathPattern.parse("/albums/:id")

    assert R.match(path, path_pattern) == true
  end

  test "match /albums/12/edit <=> /albums/:id/edit" do
    path = Path.parse("/albums/12/edit")
    path_pattern = PathPattern.parse("/albums/:id/edit")

    assert R.match(path, path_pattern) == true
  end

  test "match /albums/12/edit <=> /albums" do
    path = Path.parse("/albums/12/edit")
    path_pattern = PathPattern.parse("/albums")

    assert R.match(path, path_pattern) == false
  end

  test "match /albums <=> /albums/:id/edit" do
    path = Path.parse("/albums")
    path_pattern = PathPattern.parse("/albums/:id/edit")

    assert R.match(path, path_pattern) == false
  end

  test "match /albums/12/photos/1 <=> /albums/:album_id/photos/:id" do
    path = Path.parse("/albums/12/photos/1")
    path_pattern = PathPattern.parse("/albums/:album_id/photos/:id")

    assert R.match(path, path_pattern) == true
  end

end
