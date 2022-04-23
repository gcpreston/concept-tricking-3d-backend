defmodule Tricking3dBackendWeb.TrickControllerTest do
  use Tricking3dBackendWeb.ConnCase

  import Tricking3dBackend.TricksFixtures

  alias Tricking3dBackend.Tricks.Trick

  @create_attrs %{
    description: "some description",
    name: "some name"
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name"
  }
  @invalid_attrs %{description: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tricks", %{conn: conn} do
      conn = get(conn, Routes.trick_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create trick" do
    test "renders trick when data is valid", %{conn: conn} do
      conn = post(conn, Routes.trick_path(conn, :create), trick: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.trick_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "description" => "some description",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.trick_path(conn, :create), trick: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update trick" do
    setup [:create_trick]

    test "renders trick when data is valid", %{conn: conn, trick: %Trick{id: id} = trick} do
      conn = put(conn, Routes.trick_path(conn, :update, trick), trick: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.trick_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, trick: trick} do
      conn = put(conn, Routes.trick_path(conn, :update, trick), trick: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete trick" do
    setup [:create_trick]

    test "deletes chosen trick", %{conn: conn, trick: trick} do
      conn = delete(conn, Routes.trick_path(conn, :delete, trick))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.trick_path(conn, :show, trick))
      end
    end
  end

  defp create_trick(_) do
    trick = trick_fixture()
    %{trick: trick}
  end
end
