defmodule AVDataStore.Sales.LineItem do
  use Ecto.Schema
  import Ecto.Changeset
  alias AVDataStore.Transport
  alias AVDataStore.Sales.LineItem

  embedded_schema do
    field :vehicle_id, :integer
    field :vehicle_name, :string
    field :quantity, :integer, default: 1
    field :unit_price, :decimal
    field :total, :decimal
    field :duration, :integer
  end

  @doc false
  def changeset(%LineItem{} = line_item, attrs) do
    line_item
    |> cast(attrs, [:vehicle_id, :vehicle_name, :quantity, :unit_price, :total, :duration])
    |> set_vehicle_details
    |> set_total
    |> validate_required([:vehicle_id, :vehicle_name, :quantity, :unit_price, :duration])
  end

  defp set_vehicle_details(changeset) do
    case get_change(changeset, :vehicle_id) do
      nil -> changeset
      vehicle_id ->
        vehicle = Transport.get_vehicle!(vehicle_id)
        changeset
        |> put_change(:vehicle_name, vehicle.name)
        |> put_change(:unit_price, "150")
        # |> put_change(:duration, vehicle.duration)
    end
  end

  defp set_total(changeset) do
    quantity = get_field(changeset, :quantity) |> Decimal.new
    duration = get_field(changeset, :duration) |> Decimal.new
    unit_price = get_field(changeset, :unit_price)
    changeset
    |> put_change(:total, Decimal.mult(unit_price, quantity, duration))
  end
end
