defmodule Thunder.RequestHandler do

  def init({_any, :http}, req, []) do
    {:ok, req, :undefined}
  end

  def handle(req, state) do
    {path, _} = :cowboy_req.path(req)

    response = "You have requested: #{path}"
    match = Thunder.Router.match_path(path)
    IO.puts inspect(match)

    :cowboy_req.reply(200, [], response, req)
    {:ok, req, state}
  end

  def terminate(_reason, _req, _state) do
    :ok
  end

end
