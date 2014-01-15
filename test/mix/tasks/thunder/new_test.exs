defmodule Mix.Tasks.WeberTest do
  use ExUnit.Case

  @app_name "photo_blog"

  setup_all do
    Mix.Tasks.Thunder.New.run([@app_name])
    :ok
  end

  test "creates files and directories" do
    expected_files = [".gitignore",
      "README.md",
      "lib",
      "lib/application.ex",
      "lib/mix",
      "lib/mix/tasks",
      "lib/mix/tasks/app.ex",
      "mix.exs",
      "test",
      "test/test_helper.exs"]


    lc file inlist expected_files do
      path = Path.join(project_path, file)

      assert File.exists?(path)
    end
  end

  test "files contain application name" do
    path = Path.join(project_path, "lib/application.ex")
    {:ok, content} = File.read(path)

    assert Regex.match?(%r/PhotoBlog/, content)
  end

  teardown_all do
    File.rm_rf(project_path)
    :ok
  end

  def project_path do
    {_, root_dir} = File.cwd
    path = Path.join([root_dir, "../", @app_name])

    Path.expand(path)
  end

end

