defmodule Mix.Tasks.Thunder do

  use Mix.Task

  @doc """
  Prints available commands.
  """
  def run([]) do
    help
  end

  defp help do
    Mix.shell.info """
    Help:

      mix thunder.new  app_name  # Creates new app in ../app_name
      mix thunder      --help    # This help
    """
  end

end
