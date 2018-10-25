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
    cart_changeset = Sales.change_cart(cart)
    render conn, "show.html", cart: cart, cart_changeset: cart_changeset
  end

  def update(conn, %{"cart" => cart_params}) do
      cart = conn.assigns.cart
      case Sales.update_cart(cart, cart_params) do
        {:ok, _} ->
          conn
          |> put_flash(:info, "Cart updated successfully")
          |> redirect(to: transport_cart_path(conn, :show))
        {:error, _} ->
          conn
          |> put_flash(:info, "Error updating cart")
          |> redirect(to: transport_cart_path(conn, :show))
      end
    end
end
