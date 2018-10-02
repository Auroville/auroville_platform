defmodule AvDataStore.Repo.Migrations.CreateBookingItems do
  use Ecto.Migration

  def change do
    create table(:transport_booking_items) do
      add :amount_paid, :decimal
      add :booking_id, :integer
      add :booking_status, :string
      add :cycle_category_id, :integer
      add :cycle_item_id, :integer
      add :end_date, :date
      add :payment, :decimal
      add :payment_status, :string
      add :start_date, :date
      add :tax, :decimal
      add :total, :decimal

      timestamps()
    end

  end
end
