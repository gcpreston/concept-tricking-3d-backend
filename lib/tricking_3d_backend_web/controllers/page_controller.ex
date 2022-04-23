defmodule Tricking3dBackendWeb.PageController do
  use Tricking3dBackendWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
