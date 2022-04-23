defmodule Tricking3dBackend.Repo.Migrations.CreateTricks do
  use Ecto.Migration

  def change do
    create table(:tricks) do
      add :name, :string
      add :description, :string

      timestamps()
    end
  end
end
