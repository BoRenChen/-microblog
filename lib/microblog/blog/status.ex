defmodule Microblog.Blog.Status do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Status
  alias Microblog.Blog.User
  alias Microblog.Feedback.Like


  schema "statuses" do
    field :atTag, :string
    field :content, :string
    field :createBy, :string
    field :hashTag, :string
    field :like, :decimal
    belongs_to :user, Microblog.Blog.User
    has_many :likes, Microblog.Feedback.Like

    timestamps()
  end

  @doc false
  def changeset(%Status{} = status, attrs) do
    status
    |> cast(attrs, [:createBy, :content, :hashTag, :atTag, :like, :user_id])
    |> validate_required([:createBy, :content, :hashTag, :atTag, :like,:user_id])
  end

  
end
