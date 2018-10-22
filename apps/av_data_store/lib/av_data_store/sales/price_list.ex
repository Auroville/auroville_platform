defmodule AvDataStore.Sales.Price do
  use Ecto.Schema
  import Ecto.Changeset


  schema "sales_price" do
    field :price_aurovillian, :string
    field :price_guest, :integer
    field :price_volunteer, :decimal
    field :vehicle_id, :decimal
    field :vehicle_name, :decimal

    timestamps()
  end

  @doc false
  def changeset(price_list, attrs) do
    price_list
    |> cast(attrs, [:vehicle_name, :vehicle_id, :price_volunteer, :price_guest, :price_aurovillian])
    |> validate_required([:vehicle_name, :vehicle_id, :price_volunteer, :price_guest, :price_aurovillian])
  end
end
