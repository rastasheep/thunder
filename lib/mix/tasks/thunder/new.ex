defmodule Mix.Tasks.Thunder.New do

  use Mix.Task

  def run([]) do
    Mix.shell.info "You must supply application name."
  end

  @doc """
  Creates Thunder application.
  """
  def run([name]) do
    application_name = Mix.Utils.underscore(name)
    application_module = Mix.Utils.camelize(name)

    bindings = [application_name: application_name,
                application_module: application_module]

    Mix.Generator.create_directory(project_path(application_name))

    lc file inlist template_files do
      destination = destination_path(file, project_path(application_name))

      if File.dir?(file) do
        Mix.Generator.create_directory(destination)
      else
        contents = EEx.eval_file(file, bindings)

        Mix.Generator.create_file(destination, contents)
      end
    end
  end

  defp project_path(application_name) do
    path = Path.join([root_path, "../", application_name])

    Path.expand(path)
  end

  defp template_files do
    file_pattern = Path.join(template_path, "**/*")

    Path.wildcard(file_pattern)
  end

  defp destination_path(file, destination_path) do
    relative_path = Path.relative_to(file, template_path)

    Path.join(destination_path, relative_path)
  end

  defp template_path do
    Path.join(root_path, "template")
  end

  defp root_path do
    {_, root_dir} = File.cwd

    root_dir
  end

end
