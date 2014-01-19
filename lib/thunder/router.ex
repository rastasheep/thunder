defmodule Thunder.Router do

  def match_path(path) do
    parsed_path = Thunder.Router.Path.parse(path)
    routes = Thunder.Router.Routes.routes

    Enum.find routes, fn(route) -> match(parsed_path, route) end
  end

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

end
