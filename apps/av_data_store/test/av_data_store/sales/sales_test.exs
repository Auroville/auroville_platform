defmodule AVDataStore.SalesTest do
  use AVDataStore.DataCase
  alias AVDataStore.{Sales, Repo}
  alias AVDataStore.Sales.Order
  alias AVDataStore.Trasnport.Vehicle
  import AVDataStore.Factory

  test "create_cart" do
    assert %Order{status: "In Cart"} = Sales.create_cart
  end

  test "get_cart/1" do
    cart1 = Sales.create_cart
    cart2 = Sales.get_cart(cart1.id)
    assert cart1.id == cart2.id
  end

  test "add_to_cart/2" do
    vehicle = insert(:transport_vehicle_valid)
    cart = Sales.create_cart
    {:ok, cart} = Sales.add_to_cart(cart, %{"vehicle_id" => vehicle.id, "quantity" => "2"})
    assert [line_item] = cart.line_items
    assert line_item.vehicle_id == vehicle.id
    assert line_item.vehicle_name == vehicle.name
    assert line_item.quantity == 2
  end
end
