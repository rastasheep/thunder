defmodule Thunder.Router.PathPattern do

  def parse(path) do
    lc element inlist Thunder.Router.PathUtils.parse(path) do
      case element do
        <<58, binding :: binary>> -> {:binding, binding}
        _ -> {:segment, element}
      end
    end
  end

end
