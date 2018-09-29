defmodule AVPublic.Transport.Vehicle do
  use Ecto.Schema
  import Ecto.Changeset


  schema "vehicles" do
    field :description, :string
    field :name, :string
    field :picture, :string
    field :price, {:array, :decimal}
    field :type, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(vehicle, attrs) do
    vehicle
    |> cast(attrs, [:name, :type, :picture, :description, :price])
    |> validate_required([:name, :type, :picture, :description, :price])
  end
end
