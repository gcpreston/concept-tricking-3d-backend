defmodule Tricking3dBackend.Repo.Migrations.CreateMocapTrickers do
  use Ecto.Migration

  def change do
    create table(:mocap_trickers) do
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :dob, :date

      timestamps()
    end
  end
end
