defmodule Thunder.Router.Mapper do

  def resources_routes(resource_name) do
    url = "/#{resource_name}"
    controller = controller_module(resource_name)

    [[method: "GET",    path: url,                controller: controller, action: :index],
     [method: "GET",    path: url <> "/new",      controller: controller, action: :new],
     [method: "POST",   path: url,                controller: controller, action: :create],
     [method: "GET",    path: url <> "/:id",      controller: controller, action: :show],
     [method: "GET",    path: url <> "/:id/edit", controller: controller, action: :edit],
     [method: "PUT",    path: url <> "/:id",      controller: controller, action: :update],
     [method: "DELETE", path: url <> "/:id",      controller: controller, action: :destroy]]
  end

  def get_route(path_pattern, mapping) do
    {controller, action} = mapping_to_controller_action(mapping)

    [[method: "GET", path: path_pattern, controller: controller, action: action]]
  end

  defp mapping_to_controller_action(mapping) do
    {:ok, controller_action} = Dict.fetch(mapping, :to)
    [controller_name | action_list] = String.split(controller_action, "#")
    [action | _ ] = action_list
    controller = controller_module(controller_name)

    {controller, binary_to_atom(action)}
  end

  defp controller_module(name) do
    with_controller = "#{name}_controller"
    with_elixir_prepended = "Elixir." <> camelize(with_controller)

    binary_to_atom(with_elixir_prepended)
  end

  defp camelize(string) do
    Mix.Utils.camelize(string)
  end

end
