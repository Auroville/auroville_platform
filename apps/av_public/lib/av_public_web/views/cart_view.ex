defmodule AVPublicWeb.Transport.CartView do
  use AVPublicWeb, :view
  alias AVDataStore.Sales.Cart

  def cart_count(conn = %Plug.Conn{}) do
    cart_count(conn.assigns.cart)
  end

  def cart_count(cart = %Cart{}) do
    Enum.reduce(cart.line_items, 0, fn(item, acc) ->
      acc + item.quantity
    end)
  end

end
