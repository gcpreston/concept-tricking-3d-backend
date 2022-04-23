defmodule Tricking3dBackendWeb.TrickView do
  use Tricking3dBackendWeb, :view
  alias Tricking3dBackendWeb.TrickView

  def render("index.json", %{tricks: tricks}) do
    %{data: render_many(tricks, TrickView, "trick.json")}
  end

  def render("show.json", %{trick: trick}) do
    %{data: render_one(trick, TrickView, "trick.json")}
  end

  def render("trick.json", %{trick: trick}) do
    %{
      id: trick.id,
      name: trick.name,
      description: trick.description
    }
  end
end
