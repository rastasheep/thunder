defmodule Thunder.HttpServer do

  def run do
    dispatcher = Thunder.HttpServer.Dispatcher.create

    start_http(dispatcher)
  end

  defp start_http(dispatcher) do
    {:ok, _} = :cowboy.start_http(:http,
                                  100,
                                  [port: 3000],
                                  [env: [dispatch: dispatcher]])
  end

end
