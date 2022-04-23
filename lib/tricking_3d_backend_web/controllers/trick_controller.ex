defmodule Tricking3dBackendWeb.TrickController do
  use Tricking3dBackendWeb, :controller

  alias Tricking3dBackend.Tricks
  alias Tricking3dBackend.Tricks.Trick

  action_fallback Tricking3dBackendWeb.FallbackController

  def index(conn, _params) do
    tricks = Tricks.list_tricks()
    render(conn, "index.json", tricks: tricks)
  end

  def create(conn, %{"trick" => trick_params}) do
    with {:ok, %Trick{} = trick} <- Tricks.create_trick(trick_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.trick_path(conn, :show, trick))
      |> render("show.json", trick: trick)
    end
  end

  def show(conn, %{"id" => id}) do
    trick = Tricks.get_trick!(id)
    render(conn, "show.json", trick: trick)
  end

  def update(conn, %{"id" => id, "trick" => trick_params}) do
    trick = Tricks.get_trick!(id)

    with {:ok, %Trick{} = trick} <- Tricks.update_trick(trick, trick_params) do
      render(conn, "show.json", trick: trick)
    end
  end

  def delete(conn, %{"id" => id}) do
    trick = Tricks.get_trick!(id)

    with {:ok, %Trick{}} <- Tricks.delete_trick(trick) do
      send_resp(conn, :no_content, "")
    end
  end
end
