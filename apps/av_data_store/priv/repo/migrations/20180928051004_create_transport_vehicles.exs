defmodule AVDataStore.Repo.Migrations.CreateTransportVehicles do
  use Ecto.Migration

  def change do
    create table(:transport_vehicles) do
      add :name, :string
      add :type, :string
      add :picture, :string
      add :description, :text

      timestamps()
    end

  end
end
