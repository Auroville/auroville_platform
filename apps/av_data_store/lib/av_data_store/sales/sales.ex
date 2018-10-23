defmodule AVDataStore.Sales do
  alias AVDataStore.Repo
  alias AVDataStore.Sales.Order
  alias AVDataStore.Sales.Cart

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
    attrs = %{line_items: [cart_params]}
    update_cart(cart, attrs)
  end

  def add_to_cart(%Cart{line_items: existing_line_items} = cart, cart_params) do
    new_item = %{
      vehicle_id: String.to_integer(cart_params["vehicle_id"]),
      quantity: String.to_integer(cart_params["quantity"]),
      duration: 5 }
      existing_line_items = existing_line_items |> Enum.map(&Map .from_struct/1)
      Enum.filter(existing_line_items, fn x ->
        case x.vehicle_id == new_item.vehicle_id do
          
        end
      end)
      attrs = %{line_items: [new_item | existing_line_items]}
      update_cart(cart, attrs)
  end

  def update_cart(cart, attrs) do
    cart
    |> Cart.changeset(attrs)
    |> Repo.update
  end

end
