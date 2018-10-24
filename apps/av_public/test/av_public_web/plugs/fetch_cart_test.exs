defmodule AVPublic.Plugs.FetchCartTest do
  use AVPublicWeb.ConnCase
  alias AVDataStore.Sales.Order

  test "create and test cart on first visit" do
    conn = get build_conn(), "/"
    cart_id = get_session(conn, :cart_id)
    assert %Cart{status: "In Cart"} = conn.assigns.cart
    assert cart_id == conn.assigns.cart.id
  end

  test"fetch cart session on subsequent visit" do
    conn = get build_conn(), "/"
    cart_id = get_session(conn, :cart_id)
    conn = get conn, "/"
    assert cart_id == conn.assigns.cart.id
  end

end
