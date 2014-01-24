defmodule Thunder.ActionDispatch do

  def dispatch(route) do
    case route do
      [{:method, _method}, {:path, path}, {:controller, controller}, {:action, action}] ->
        response = Module.function(controller, action, 0).()
        {200, response}
      [] -> {404, "Page not found"}
      _ -> {404, "Page not found"}
    end
  end

end
