defmodule Thunder.RequestHandler do

  def init({_any, :http}, req, []) do
    {:ok, req, :undefined}
  end

  def handle(req, state) do
    {path, _} = :cowboy_req.path(req)

    route = Thunder.Router.match_path(path)

    {status_code, response} = Thunder.ActionDispatch.dispatch(route)

    :cowboy_req.reply(status_code, [], response, req)
    {:ok, req, state}
  end

  def terminate(_reason, _req, _state) do
    :ok
  end

end
