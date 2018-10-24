defmodule AVPublicWeb.Router do
  use AVPublicWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :assign_current_user
    plug AVPublicWeb.Plugs.FetchCart
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AVPublicWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/oauth/:provider", AuthController, :index
    get "/oauth/:provider/callback", AuthController, :callback

    scope "/transport", Transport, as: :transport do
      get "/", SearchController, :index
      get "/cart", CartController, :show
      post "/cart", CartController, :add
    end

  end

  scope "/", AVPublicWeb do
    pipe_through [:browser, AVPublicWeb.RequireAuthPlug]

    delete "/logout", AuthController, :delete
  end

  # Fetch the current user from the session and add it to `conn.assigns`. This
  # will allow you to have access to the current user in your views with
  # `@current_user`.
  defp assign_current_user(conn, _) do
    assign(conn, :current_user, get_session(conn, :current_user))
  end

end
