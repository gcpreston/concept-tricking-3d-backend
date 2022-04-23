defmodule Tricking3dBackend.Repo.Migrations.CreateTrickStances do
  use Ecto.Migration

  def change do
    create table(:trick_stances) do
      add :trick_id, references(:tricks, on_delete: :delete_all), null: false
      add :stance_id, references(:stances, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:trick_stances, [:trick_id])
    create index(:trick_stances, [:stance_id])
  end
end
