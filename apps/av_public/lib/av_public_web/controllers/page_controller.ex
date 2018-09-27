defmodule AVPublicWeb.PageController do
  use AVPublicWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
