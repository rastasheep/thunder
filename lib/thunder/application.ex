defmodule Thunder.Application do
  use GenServer.Behaviour

  def start_link do
    :gen_server.link({}, __MODULE__, [], [])
  end

end
