defmodule Tricking3dBackend.Tricks.Stance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stances" do
    field :description, :string
    field :direction, Ecto.Enum, values: [:forward, :backward]
    field :name, :string
    field :plant_foot, Ecto.Enum, values: [:left, :right]

    timestamps()
  end

  @doc false
  def changeset(stance, attrs) do
    stance
    |> cast(attrs, [:name, :description, :plant_foot, :direction])
    |> validate_required([:name, :description, :plant_foot, :direction])
  end
end
