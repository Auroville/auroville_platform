defmodule AvDataStore.Transport.Cycle_tariff do
  use Ecto.Schema
  import Ecto.Changeset


  schema "transport_cycle_tariffs" do
    field :duration, :integer
    field :price, :decimal
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(cycle_tariff, attrs) do
    cycle_tariff
    |> cast(attrs, [:price, :status, :duration])
    |> validate_required([:price, :status, :duration])
  end
end
