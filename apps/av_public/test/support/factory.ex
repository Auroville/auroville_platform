defmodule AVPublic.Factory do
  use ExMachina.Ecto, repo: AVDataStore.Repo
  use AVDataStore.TransportVehicleFactory
end
