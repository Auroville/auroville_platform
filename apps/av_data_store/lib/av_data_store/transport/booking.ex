defmodule AvDataStore.Transport.Booking do
  use Ecto.Schema
  import Ecto.Changeset

    @moduledoc """
      Contains a unique booking id mapped to the booking item and customer

    """

    schema "trasnport_bookings" do
    field :booking_id, :integer
    field :customer_id, :integer

    timestamps()
  end

  @doc false
  def changeset(booking, attrs) do
    booking
    |> cast(attrs, [:booking_id, :user_id])
    |> validate_required([:booking_id, :user_id])
  end
end
