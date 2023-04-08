defmodule K8xWeb.PageController do
  use K8xWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
