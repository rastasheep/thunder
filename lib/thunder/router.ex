defmodule Thunder.Router do

  def match([], []) do
    true
  end

  def match([path_head | path_tail], [path_pattern_head | path_pattern_tail]) do
    if match_segment(path_head, path_pattern_head) do
      match(path_tail, path_pattern_tail)
    else
      false
    end
  end

  def match([path_head | path_tail], []) do
    false
  end

  def match([], [path_pattern_head | path_pattern_tail]) do
    false
  end

  def match_segment({:segment, path_segment}, {:segment, path_pattern_segment}) do
    path_segment == path_pattern_segment
  end

  def match_segment({:segment, _}, {:binding, _}) do
    true
  end

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
