defmodule K8xWeb.PageController do
  use K8xWeb, :controller

  def home(conn, _params) do
    host = System.get_env("POD_IP")
    render(conn, :home, host: host)
  end

  def health(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{status: "ok"})
  end
end
