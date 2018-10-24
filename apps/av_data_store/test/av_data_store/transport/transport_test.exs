defmodule AVDataStore.TransportTest do
  use AVDataStore.DataCase
  alias AVDataStore.Transport

  describe "get_available_vehicles" do
    test "returns a list of vehicles" do
      {:ok, vehicle} = %AVDataStore.Transport.Vehicle{name: "Sporty e-cycle"} |> AVDataStore.Repo.insert
      assert [vehicle] == Transport.get_available_vehicles
    end
  end
end
