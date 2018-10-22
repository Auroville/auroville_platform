defmodule AvDataStore.Repo.Migrations.CreatePrice do
  use Ecto.Migration

  def change do
    create table(:sales_price) do
      add :vehicle_name, :string
      add :vehicle_id, :integer
      add :price_volunteer, :decimal
      add :price_guest, :decimal
      add :price_aurovillian, :decimal

      timestamps()
    end

  end
end
