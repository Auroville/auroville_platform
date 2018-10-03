defmodule AVDataStore.TransportTest do
  use AVDataStore.DataCase
  alias AVDataStore.Transport

  describe "list_vehicles" do
    test "returns a list of vehicles" do
      {:ok, vehicle} = %AVDataStore.Transport.Vehicle{name: "Sporty e-cycle"} |> AVDataStore.Repo.insert
      assert [vehicle] == Transport.list_vehicles
    end
  end
end
