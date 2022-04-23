defmodule Tricking3dBackend.Repo.Migrations.CreateStances do
  use Ecto.Migration

  def change do
    create table(:stances) do
      add :name, :string
      add :description, :string
      add :plant_foot, :string
      add :direction, :string

      timestamps()
    end
  end
end
