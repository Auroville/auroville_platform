defmodule AVDataStore.Transport.Vehicle do
  use Ecto.Schema
  import Ecto.Changeset

  alias AVDataStore.Sales.Pricing

  @moduledoc """
    Provides Vehicle schema which are rentable entity in the transport context.

    name: Name of the vehicle
    type: Vehicle type such as Car, Cycle, Bike etc.,
  """

  schema "transport_vehicles" do
    field :description, :string
    field :name, :string
    field :picture, :string
    field :type, :string
    field :vehicle_id, :integer
    has_many :prices, Pricing

    timestamps()
  end

  @doc false
  def changeset(vehicle, attrs) do
    vehicle
    |> cast(attrs, [:name, :type, :picture, :description])
    |> validate_required([:name, :type, :picture, :description])
  end
end
