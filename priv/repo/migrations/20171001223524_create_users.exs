defmodule Microblog.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :firstName, :string
      add :lastName, :string

      timestamps()
    end

  end
end
