defmodule Thunder.Router do

  def parse_path_pattern(path) do
    lc element inlist parse(path) do
      case element do
        <<58, binding :: binary>> -> [binding: binding]
        _ -> [segment: element]
      end
    end |> List.flatten
  end

  def parse(path) do
    lc segment inlist String.split(path, "/"), segment != "", do: segment
  end

end
