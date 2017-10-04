defmodule Microblog.Repo.Migrations.AddUserReferenceEToStatus do
  use Ecto.Migration

  def change do
  	alter table("statuses") do
  		add :user_id, references(:users, on_delete: :delete_all), null: false, default: 1
    end
  end
end
