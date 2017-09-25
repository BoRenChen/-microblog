defmodule Microblog.Blog.Status do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Status


  schema "statuses" do
    field :atTag, :string
    field :content, :string
    field :createBy, :string
    field :hashTag, :string
    field :like, :decimal

    timestamps()
  end

  @doc false
  def changeset(%Status{} = status, attrs) do
    status
    |> cast(attrs, [:createBy, :content, :hashTag, :atTag, :like])
    |> validate_required([:createBy, :content, :hashTag, :atTag, :like])
  end
end
