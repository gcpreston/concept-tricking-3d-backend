defmodule Tricking3dBackend.Tricks.TrickStance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trick_stances" do
    belongs_to :trick, Tricking3dBackend.Tricks.Trick
    belongs_to :stance, Tricking3dBackend.Tricks.Stance

    # hello
    timestamps()
  end

  @doc false
  def changeset(trick_stance, attrs) do
    trick_stance
    |> cast(attrs, [:trick_id, :stance_id])
    |> validate_required([:trick_id, :stance_id])
    |> cast_assoc(:trick)
    |> cast_assoc(:stance)
  end
end
