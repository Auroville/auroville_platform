defmodule AVDataStore.Transport do

  alias AVDataStore.Repo
  alias AVDataStore.Transport.Vehicle

  import Ecto.Changeset

  def list_vehicles do
    Vehicle
    |> Repo.all
  end

  def get_vehicle!(id) do
    Vehicle
    |> Repo.get!(id)
  end

end
