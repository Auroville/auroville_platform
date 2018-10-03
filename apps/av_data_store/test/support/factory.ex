defmodule AVDataStore.Factory do
  use ExMachina.Ecto, repo: AVDataStore.Repo
  use AVDataStore.TransportVehicleFactory
end
