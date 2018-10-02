defmodule AVPublicWeb.RequireAuthPlug do
  def init(_), do: []
  def call(conn, _) do
    if conn.assigns.current_user do
      conn
    else
      Phoenix.Controller.redirect(conn, to: "/login")
    end
  end
end
