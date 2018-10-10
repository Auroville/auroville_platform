defmodule AVPublicWeb.Transport.CartController do
  use AVPublicWeb, :controller

  alias AVDataStore.Sales

  def add(conn, %{"cart" => cart_params}) do
    cart = conn.assigns.cart
    case Sales.add_to_cart(cart, cart_params) do
      {:ok, _} ->
        %{"vehicle_name" => name, "duration" => duration, "quantity"=> qty } = cart_params
        message = "Product added to cart - #{name} x #{qty} qty for (#{duration}) days"
        conn
        |> put_flash(:info, message)
        |> redirect(to: search_path(conn, :show))
      {:error, _} ->
        conn
        |> put_flash(:info, "Error adding vehicle to cart")
        |> redirect(to: search_path(conn, :show))
    end
  end

  def show(conn, _params) do
    cart = conn.assigns.cart
    render conn, "show.html", cart: cart
  end
end
