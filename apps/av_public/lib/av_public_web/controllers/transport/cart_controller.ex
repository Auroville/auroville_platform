defmodule AVPublicWeb.Transport.CartController do
  use AVPublicWeb, :controller

  alias AVDataStore.Sales

  def add(conn, cart_params) do
    cart = conn.assigns.cart
    case Sales.add_to_cart(cart, cart_params) do
      {:ok, _} ->
        %{"vehicle_name" => name, "quantity"=> qty } = cart_params
        message = "Product added to cart - #{name} x #{qty} qty"
        conn
        |> put_flash(:info, message)
        |> redirect(to: transport_search_path(conn, :index))
      {:error, _} ->
        conn
        |> put_flash(:info, "Error adding vehicle to cart")
        |> redirect(to: transport_search_path(conn, :index))
    end
  end

  def show(conn, _params) do
    cart = conn.assigns.cart
    render conn, "show.html", cart: cart
  end
end
