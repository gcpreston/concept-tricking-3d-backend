defmodule Tricking3dBackend.Tricks.Trick do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tricks" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(trick, attrs) do
    trick
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
