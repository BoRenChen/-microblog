defmodule MicroblogWeb.LikeView do
  use MicroblogWeb, :view
  alias MicroblogWeb.LikeView

  def render("index.json", %{likes: likes}) do
    %{data: render_many(likes, LikeView, "like.json")}
  end

  def render("show.json", %{like: like}) do
    %{data: render_one(like, LikeView, "like.json")}
  end

  def render("like.json", %{like: like}) do
    data = %{
      id: like.id,
      status_id: like.status_id,
      user_id: like.user_id,
    }

    if Ecto.assoc_loaded?(like.user) do
      Map.put(data, :user_email, like.user.email)
    else
      data
    end

     if Ecto.assoc_loaded?(like.status) do
          Map.put(data, :status_id, like.status_id)
       else
       data
      end
  end






end
