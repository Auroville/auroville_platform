defmodule AVDataStore.TransportCartFactory do
  defmacro __using__(_opts) do
    quote do
      def transport_cart_factory do
        %AVDataStore.Transport.Cart{
          line_items: %AVDataStore.Transport.Line_Item{
            vehicle_id: 2,
            vehicle_name: "Sporty Cycle",
            quantity: 1,
            unit_price: 150,
            total: 300,
            duration: 2
          },
          status: sequence(:status, ["In Cart", "Processed"]),
          total: 2345
        }
      end

      def transport_empty_cart_factory do
        %AVDataStore.Transport.Cart{
          line_items: %AVDataStore.Transport.Line_Item{},
          status: "In Cart",
          total: 0
        }
      end
    end
  end
end
