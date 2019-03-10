defmodule Mercury.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false
      add :email, :string, null: false
      add :name, :string, null: false
      add :bio, :text

      timestamps()
    end
  end
end
