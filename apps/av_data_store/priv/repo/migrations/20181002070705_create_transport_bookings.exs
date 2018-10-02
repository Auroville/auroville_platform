defmodule AvDataStore.Repo.Migrations.CreateBookings do
  use Ecto.Migration

  def change do
    create table(:transport_bookings) do
      add :booking_id, :integer
      add :user_id, :integer

      timestamps()
    end

  end
end
