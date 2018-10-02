defmodule AvDataStore.Transport.Booking do
  use Ecto.Schema
  import Ecto.Changeset


  schema "trasnport_bookings" do
    field :booking_id, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(booking, attrs) do
    booking
    |> cast(attrs, [:booking_id, :user_id])
    |> validate_required([:booking_id, :user_id])
  end
end
