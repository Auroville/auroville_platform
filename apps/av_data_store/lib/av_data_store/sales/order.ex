defmodule AVDataStore.Sales.Order do
  use Ecto.Schema
  import Ecto.Changeset
  alias AVDataStore.Sales.{Order, LineItem}


  schema "sales_orders" do
    embeds_many :line_items, LineItem, on_replace: :delete
    field :status, :string
    field :from_date, :date
    field :to_date, :date
    field :subtotal, :decimal
    field :tax_cgst, :decimal
    field :tax_sgst, :decimal
    field :total, :decimal
    field :customer_id, :integer
    field :name, :string
    field :email, :string
    field :uuid, :string
    field :id_type, :string
    field :id_value, :string
    field :contact_number, :string
    field :user_status, :string

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:status, :total])
    |> cast_embed(:line_items, required: true, with: &LineItem .changeset/2)
    |> set_order_total
    |> validate_required([:status, :total])
  end

  defp set_order_total(changeset) do
    items = get_field(changeset, :line_items)
    total = Enum.reduce(items, Decimal.new(0), fn(item, acc) ->
      Decimal.add(acc, item.total)
    end)
    changeset
    |> put_change(:total, total)
  end
end