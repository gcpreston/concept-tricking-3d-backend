defmodule Tricking3dBackend.Animations.Model do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tricking3dBackend.Animations.MocapTricker

  schema "models" do
    field :filepath, :string
    field :name, :string

    belongs_to :mocap_tricker, MocapTricker

    timestamps()
  end

  @doc false
  def changeset(model, attrs) do
    model
    |> cast(attrs, [:name, :filepath])
    |> validate_required([:name, :filepath])
  end
end
