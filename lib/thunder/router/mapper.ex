defmodule Thunder.Router.Mapper do

  def resources_routes(resource_name) do
    url = "/#{resource_name}"
    controller = resource_name

    [[method: "GET",    path: url,                controller: controller, action: :index],
     [method: "GET",    path: url <> "/new",      controller: controller, action: :new],
     [method: "POST",   path: url,                controller: controller, action: :create],
     [method: "GET",    path: url <> "/:id",      controller: controller, action: :show],
     [method: "GET",    path: url <> "/:id/edit", controller: controller, action: :edit],
     [method: "PUT",    path: url <> "/:id",      controller: controller, action: :update],
     [method: "DELETE", path: url <> "/:id",      controller: controller, action: :destroy]]
  end

  def get_route(path_pattern, mapping) do
    {:ok, controller_action} = Dict.fetch(mapping, :to)

    [controller | action_list] = String.split(controller_action, "#")
    [action | _ ] = action_list

    [[method: "GET", path: path_pattern, controller: binary_to_atom(controller), action: binary_to_atom(action)]]
  end

end
