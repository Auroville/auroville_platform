defmodule AvDataStore.Transport.Booking_item do
  use Ecto.Schema
  import Ecto.Changeset


  schema "transport_booking_items" do
    field :amount_paid, :decimal
    field :booking_id, :integer
    field :booking_status, :string
    field :cycle_category_id, :integer
    field :cycle_item_id, :integer
    field :end_date, :date
    field :payment, :decimal
    field :payment_status, :string
    field :start_date, :date
    field :tax, :decimal
    field :total, :decimal

    timestamps()
  end

  @doc false
  def changeset(booking_item, attrs) do
    booking_item
    |> cast(attrs, [:booking_id, :cycle_category_id, :cycle_item_id, :start_date, :end_date, :payment, :tax, :total, :amount_paid, :payment_status, :booking_status])
    |> validate_required([:booking_id, :cycle_category_id, :cycle_item_id, :start_date, :end_date, :payment, :tax, :total, :amount_paid, :payment_status, :booking_status])
  end
end
