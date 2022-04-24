defmodule Tricking3dBackend.Repo.Migrations.CreateAnimations do
  use Ecto.Migration

  def change do
    create table(:animations) do
      add :name, :string
      add :model_id, references(:models, on_delete: :delete_all)
      add :trick_id, references(:tricks, on_delete: :delete_all)

      timestamps()
    end

    create index(:animations, [:model_id])
  end
end
