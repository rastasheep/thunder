defmodule Thunder.Router.Path do

  def parse(path) do
    lc element inlist Thunder.Router.PathUtils.parse(path), do: {:segment, element}
  end

end
