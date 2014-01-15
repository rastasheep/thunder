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

end
