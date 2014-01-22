defmodule Thunder.Router.Drawer do

  require Thunder.Router.Mapper, as: Mapper

  defmacro __using__(module) do
    quote do
      import Thunder.Router.Drawer, only: [resources: 1,
                                           resources: 2,
                                           draw: 1]
    end
  end

  defmacro draw(routes) do
    quote do
      def unquote(:all)() do
        unquote(routes)
      end
    end
  end

  def resources(resource_name) do
    Mapper.resources_routes(resource_name)
  end

  def resources(routes, resource_name) do
    Enum.concat(routes, Mapper.resources_routes(resource_name))
  end

end
