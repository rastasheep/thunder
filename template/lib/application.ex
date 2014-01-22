defmodule <%= application_module %> do
  use Application.Behaviour

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, _args) do
    Thunder.HttpServer.run

    Thunder.Supervisor.start_link
  end

end
