defmodule Config.Routes do

  use Thunder.Router.Drawer

  draw get("/", [to: "pages#index"])

end
