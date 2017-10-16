defmodule Microblog.Repo.Migrations.CreateLikes do
  use Ecto.Migration

  def change do
    create table(:likes) do
      add :user_id, references(:users, on_delete: :nothing)
      add :status_id, references(:statuses, on_delete: :nothing)

      timestamps()
    end

    create index(:likes, [:user_id])
    create index(:likes, [:status_id])
  end
end
