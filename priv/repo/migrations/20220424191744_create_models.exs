defmodule Tricking3dBackend.Repo.Migrations.CreateModels do
  use Ecto.Migration

  def change do
    create table(:models) do
      add :name, :string, null: false
      add :filepath, :string, null: false
      add :mocap_tricker_id, references(:mocap_trickers, on_delete: :delete_all)

      timestamps()
    end

    create index(:models, [:mocap_tricker_id])
  end
end
