defmodule AVDataStore.TransportOrderFactory do
  defmacro __using__(_opts) do
    quote do
      def transport_order_factory do
        %AVDataStore.Transport.Order{
          line_items: %AVDataStore.Transport.Line_Item{
            vehicle_id: 2,
            vehicle_name: "Sporty Cycle",
            quantity: 1,
            unit_price: 150,
            total: 300,
            duration: 2
          },
          status: sequence(:status, ["Confirmed", "Closed"]),
          total: 2345,
          name: "Siddharth",
          email: "coco@coco"
        }
      end

    end
  end
end
