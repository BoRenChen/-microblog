defmodule Microblog.Blog.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.User
  alias Microblog.Blog.Status
  alias Microblog.Feedback.Like


  schema "users" do
    field :email, :string
    field :firstName, :string
    field :lastName, :string
    has_many :statuses, Microblog.Blog.Status
    has_many :follows, Microblog.Blog.Follow
    has_many :likes, Microblog.Feedback.Like

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :firstName, :lastName])
    |> validate_required([:email, :firstName, :lastName])
  end
end
