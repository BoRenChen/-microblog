defmodule Microblog.Blog.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.User


  schema "users" do
    field :email, :string
    field :firstName, :string
    field :lastName, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :firstName, :lastName])
    |> validate_required([:email, :firstName, :lastName])
  end
end
