defmodule AVPublic.Repo.Migrations.CreateVehicles do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :name, :string
      add :type, {:array, :string}
      add :picture, :string
      add :description, :string
      add :price, {:array, :decimal}

      timestamps()
    end

  end
end
