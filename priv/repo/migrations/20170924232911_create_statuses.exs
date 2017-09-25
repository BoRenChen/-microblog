defmodule Microblog.Repo.Migrations.CreateStatuses do
  use Ecto.Migration

  def change do
    create table(:statuses) do
      add :createBy, :string
      add :content, :text
      add :hashTag, :string
      add :atTag, :string
      add :like, :decimal

      timestamps()
    end

  end
end
