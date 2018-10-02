defmodule AvDataStore.Transport.CycleTariff do
  use Ecto.Schema
  import Ecto.Changeset

  @moduledoc """
    Provides cycle tariff for calculating cost depending on status and duration.

  """

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
