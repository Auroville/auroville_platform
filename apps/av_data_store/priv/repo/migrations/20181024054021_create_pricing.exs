defmodule AvDataStore.Repo.Migrations.CreatePricing do
  use Ecto.Migration

  def change do
    create table(:sales_prices) do
      add :user_type, :string
      add :from_day_no, :integer
      add :to_day_no, :integer
      add :price, :decimal
      add :vehicle_id, references(:transport_vehicles, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:sales_prices, [:vehicle_id, :user_type, :from_day_no, :to_day_no], name: :vehicle_usertype_from_to_index)
  end
end
