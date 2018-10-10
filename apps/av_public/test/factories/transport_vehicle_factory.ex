defmodule AVDataStore.TransportVehicleFactory do
  defmacro __using__(_opts) do
    quote do
      def transport_cycle_factory do
        %AVDataStore.Transport.Vehicle{
          name: sequence(:name, &"Cycle #{&1}"),
          description: sequence(:description, &"Description #{&1}"),
          type: "E-Cycle",
          picture: "https://proxy.duckduckgo.com/iu/?u=http%3A%2F%2Fstephboreldesign.com%2Fwp-content%2Fuploads%2F2012%2F03%2Florem-ipsum-logo.jpg&f=1"
        }
      end
    end
  end
end
