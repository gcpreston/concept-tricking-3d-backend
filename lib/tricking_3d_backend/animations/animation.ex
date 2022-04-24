defmodule Tricking3dBackend.Animations.Animation do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tricking3dBackend.Animations.Model
  alias Tricking3dBackend.Tricks.Trick

  schema "animations" do
    field :name, :string

    belongs_to :model, Model
    belongs_to :trick, Trick

    timestamps()
  end

  @doc false
  def changeset(animation, attrs) do
    animation
    |> cast(attrs, [:name, :model_id, :trick_id])
    |> cast_assoc(:model)
    |> cast_assoc(:trick)
    |> validate_required([:name])
  end
end
