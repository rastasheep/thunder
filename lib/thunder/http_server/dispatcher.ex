defmodule Thunder.HttpServer.Dispatcher do

  def create do
    compile
  end

  defp compile do
    :cowboy_router.compile(configuration)
  end

  defp configuration do
    [
      {:_, [
             {:_, Thunder.RequestHandler, []}
           ]}
    ]
  end

end
