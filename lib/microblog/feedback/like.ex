defmodule Microblog.Feedback.Like do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Feedback.Like


  schema "likes" do
      belongs_to :status, Microblog.Blog.Status
      belongs_to :user, Micorblog.Blog.User
      timestamps()
  end

  @doc false
  def changeset(%Like{} = like, attrs) do
    like
    |> cast(attrs, [:user_id, :status_id])
    |> validate_required([:user_id, :status_id])
  end
end
