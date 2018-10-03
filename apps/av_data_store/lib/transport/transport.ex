defmodule AVDataStore.Transport do

  alias AVDataStore.Repo
  alias AVDataStore.Transport.Vehicle

  import Ecto.Changeset

  def list_vehicles do
    Vehicle
    |> Repo.all
  end
  
end
