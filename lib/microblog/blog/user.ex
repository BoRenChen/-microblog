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

    field :password_hash, :string
    field :pw_tries, :integer
    field :pw_last_try, :utc_datetime

    field :password, :string, virtaul: true
    field :password_confirmation, :string, virtaul: true

    has_many :statuses, Microblog.Blog.Status
    has_many :follows, Microblog.Blog.Follow
    has_many :likes, Microblog.Feedback.Like

    timestamps()
  end


  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :firstName, :lastName, :password, :password_confirmation])
    |> validate_confirmation(:password)
    |> validate_password(:password)
    |> put_pass_hash()
    |> validate_required([:email, :firstName, :lastName, :password_hash])
  end

  # Password validation
  # From Comeonin docs
  def validate_password(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, password ->
      case valid_password?(password) do
        {:ok, _} -> []
        {:error, msg} -> [{field, options[:message] || msg}]
      end
    end)
  end

  def put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Comeonin.Argon2.add_hash(password))
  end
  def put_pass_hash(changeset), do: changeset

  def valid_password?(password) when byte_size(password) > 7 do
    {:ok, password}
  end
  def valid_password?(_), do: {:error, "The password is too short"}
end