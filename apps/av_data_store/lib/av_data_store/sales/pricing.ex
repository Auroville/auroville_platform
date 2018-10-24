defmodule AVDataStore.Sales.Pricing do
  use Ecto.Schema
  import Ecto.Changeset

  alias AVDataStore.Transport.Vehicle

  schema "sales_prices" do
    field :from_day_no, :integer
    field :price, :decimal
    field :to_day_no, :integer
    field :user_type, :string
    belongs_to :vehicle, Vehicle

    timestamps()
  end

  @doc false
  def changeset(pricing, attrs) do
    pricing
    |> cast(attrs, [:user_type, :from_day_no, :to_day_no, :price])
    |> unique_constraint(:vehicletype_usertype_fromday_today_have_to_be_unique, name: :vehicle_usertype_from_to_index)
    |> validate_required([:user_type, :from_day_no, :to_day_no, :price])
  end
end
