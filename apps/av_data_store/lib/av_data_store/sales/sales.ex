defmodule AVDataStore.Sales do
  alias AVDataStore.Repo
  alias AVDataStore.Sales.{Order, Cart, LineItem}

  def get_cart(cart_id) do
    Cart
    |> Repo.get_by(id: cart_id, status: "In Cart")
  end

  def create_cart do
    %Cart{status: "In Cart"} |> Repo.insert!()
  end

  # def add_to_cart(%Cart{line_items: [] = cart}, cart_params) do
  #   #Receives existing cart
  #   #cart_params contains a map of vehicle_id and quantity
  #   #create a new line_item
  #   #generate list of maps containing vehicle_id and quantity for each line item
  #   #Check if any two line_items have same vehicle_id, consolidate them
  #   #Send cart, and list of maps to update_cart
  # end

  # def update_cart(cart, attrs) do
  #   #Receives existing cart
  #   #attrs is a list of maps of vehicle_id and quantity for each line_item
  #   #Check if any quantity has been updated to 0, remove that line_item
  #   #Update the cart items
  #   #Update the subtotal, total values of the cart
  #
  #   # cart
  #   # |> Cart.changeset(attrs)
  #   # |> Repo.update!()
  # end

  def create_order(%Cart{} = cart, name, email, uuid, user_status) do
    #Receive the cart
    #Add name, email, uuid, user_status info, put order status to confirmed
    #Insert into order table
    #Modify cart status to processed

    # %Order{cart: cart, name: name, email: email, uuid: uuid, status: "Confirmed"}
    # |> Repo.insert!()
    # cart
    # |> %Cart.changeset{"status" => "Processed"}
    # |> Repo.update!()

  end

  def add_to_cart(%Cart{line_items: []} = cart, cart_params) do
    new_item = %{
      vehicle_id: String.to_integer(cart_params["vehicle_id"]),
      quantity: String.to_integer(cart_params["quantity"]),
      duration: 5
    }
    attrs = %{line_items: [new_item]}
    update_cart(cart, attrs)
  end

  def add_to_cart(%Cart{line_items: existing_line_items} = cart, cart_params) do
    new_item = %{
      vehicle_id: String.to_integer(cart_params["vehicle_id"]),
      quantity: String.to_integer(cart_params["quantity"]),
      duration: 5 }
      existing_line_items = existing_line_items |> Enum.map(&Map .from_struct/1)
      copy_existing_line_items = existing_line_items

      existing_line_items
       |> Enum.map(fn(x) ->
         if x.vehicle_id == new_item.vehicle_id do
           update_line_item(x, %{quantity: x.quantity + new_item.quantity})
         end
       end)
      # |> Enum.map(fn %LineItem{quantity: quantity} = x ->
      #     cond do
      #      x.vehicle_id == new_item.vehicle_id ->
      #        Map.put(LineItem, :quantity, (quantity + new_item.quantity))
      #      true ->
      #        x
      #      end
      # end)
      cond do
        existing_line_items == copy_existing_line_items ->
          attrs = %{line_items: [new_item | existing_line_items]}
        true ->
          attrs = %{line_items: [existing_line_items]}
      end
      update_cart(cart, attrs)
  end

  def update_cart(cart, attrs) do
    cart
    |> Cart.changeset(attrs)
    |> Repo.update
  end

  def update_line_item(%LineItem{} = line_item, attrs) do
    line_item
    |> LineItem.update_quantity(attrs)
    |> Repo.update()
  end

end
