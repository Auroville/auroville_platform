defmodule AVPublic.Repo.Migrations.CreateTransportVehicles do
  use Ecto.Migration

  def change do
    create table(:transport_vehicles) do
      add :name, :string
      add :type, :string
      add :picture, :string
      add :description, :string

      timestamps()
    end

  end
end
