defmodule MicroblogWeb.Plugs do
   import Plug.Conn
 
  def fetch_user(conn, _opts) do
    user_id = get_session(conn, :user_id)
    if user_id do
      user = Microblog.Blog.get_user!(user_id)
      assign(conn, :session_user, user)
    else
      assign(conn, :session_user, nil)
    end
  end
 end
