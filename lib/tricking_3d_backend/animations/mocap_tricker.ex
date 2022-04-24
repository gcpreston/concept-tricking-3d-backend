defmodule Tricking3dBackend.Animations.MocapTricker do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mocap_trickers" do
    field :dob, :date
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(mocap_tricker, attrs) do
    mocap_tricker
    |> cast(attrs, [:first_name, :last_name, :dob])
    |> validate_required([:first_name, :last_name, :dob])
  end
end
