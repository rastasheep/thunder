defmodule Thunder.Router.PathPatternTest do
  use ExUnit.Case

  require Thunder.Router.PathPattern, as: P

  test "parse /albums" do
    path = "/albums"

    assert P.parse(path) == [segment: "albums"]
  end

  test "parse /albums/:id" do
    path = "/albums/:id"

    assert P.parse(path) == [segment: "albums", binding: "id"]
  end

  test "parse /albums/:id/edit" do
    path = "/albums/:id/edit"

    assert P.parse(path) == [segment: "albums", binding: "id", segment: "edit"]
  end

  test "parse /albums/:album_id/photos/:id" do
    path = "/albums/:album_id/photos/:id"

    assert P.parse(path) == [segment: "albums", binding: "album_id",
                                          segment: "photos", binding: "id"]
  end

  test "parse /albums/:album_id/photos/:id/edit" do
    path = "/albums/:album_id/photos/:id/edit"

    assert P.parse(path) == [segment: "albums", binding: "album_id",
                                          segment: "photos", binding: "id", segment: "edit"]
  end

end
