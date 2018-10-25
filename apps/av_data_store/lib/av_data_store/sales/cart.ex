defmodule AVDataStore.Sales.Cart do
  use Ecto.Schema
  import Ecto.Changeset
  alias AVDataStore.Sales.{Cart, LineItem}

  schema "sales_cart" do
    embeds_many :line_items, LineItem, on_replace: :delete
    field :customer_id, :integer
    field :status, :string
    field :from_date, :date
    field :to_date, :date
    field :subtotal, :decimal
    field :tax_cgst, :decimal
    field :tax_sgst, :decimal
    field :total, :decimal

    timestamps()
  end

  @doc false
  def changeset(cart, attrs) do
    cart
    |> cast(attrs, [:status, :total, :subtotal, :tax_cgst, :tax_sgst])
    |> cast_embed(:line_items, required: true, with: &LineItem.changeset/2)
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
