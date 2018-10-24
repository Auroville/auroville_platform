defmodule AVPublicWeb.Plugs.FetchCart do
  import Plug.Conn
  alias AVDataStore.Sales
  alias AVDataStore.Sales.Cart

  def init(_opts), do: nil

  def call(conn, _) do
    with cart_id <- get_session(conn, :cart_id),
     true <- is_integer(cart_id),
     %Cart{} = cart <- Sales.get_cart(cart_id)
     do
       conn
       |> assign(:cart, cart)
     else
       _ -> cart = Sales.create_cart()
       conn
       |> put_session(:cart_id, cart.id)
       |> assign(:cart, cart)
     end
  end
end
