defmodule Thunder.Router.PathUtils do

  def parse(path) do
    lc segment inlist String.split(path, "/"), segment != "", do: segment
  end

end
