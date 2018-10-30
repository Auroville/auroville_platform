defmodule AVDataStore.SalesTest do
  use AVDataStore.DataCase
  alias AVDataStore.{Sales, Repo}
  alias AVDataStore.Sales.{Order, Cart, LineItem}
  alias AVDataStore.Trasnport.Vehicle
  import AVDataStore.Factory

  test "get_cart" do
    cart1 = Sales.create_cart
    cart2 = Sales.get_cart(cart1.id)
    assert cart1 == cart2
  end

  test "create_cart" do
    assert %Cart{status: "In Cart"} = Sales.create_cart
  end

  # describe "create_order" do
  #   test "creates order when valid input" do
  #     cart = Sales.create_cart
  #     {:ok, order} = Sales.create_order(cart, %{"name" => "Siddharth", "email" => "soso@coco"})
  #     assert %Order{status: "Confirmed"} = order
  #     assert %Cart{status: "Processed"} = cart
  #   end
  #   test "throws error when invalid input" do
  #     cart = Sales.create_cart
  #     {:error, changeset} = Sales.create_order(cart, %{"name" => "Siddharth"})
  #     assert "cannot create order without email" in errors_on(changeset).email
  #   end
  # end

  describe "add_to_cart" do
    test "successfully add vehicle to cart" do
      vehicle = insert(:transport_vehicle)
      cart = Sales.create_cart
      {:ok, cart} = Sales.add_to_cart(cart, %{"vehicle_id" => "#{vehicle.id}", "quantity" => "2"})
      Enum.each(cart.line_items, fn(x) ->
        assert vehicle.id == x.vehicle_id
      end)
    end
  end

  test "update_cart" do
    vehicle = insert(:transport_vehicle)
    cart = Sales.create_cart
    {:ok, cart} = Sales.add_to_cart(cart, %{"vehicle_id" => "#{vehicle.id}", "quantity" => "2"})
    line_items = %{line_items: [%{"vehicle_id" => "#{vehicle.id}", "quantity" => "1", "duration" => "5"}]}
    {:ok, cart} = Sales.update_cart(cart, line_items)
      Enum.filter(cart.line_items, fn(x) ->
        assert x.quantity == 1
      end)
  end
end
