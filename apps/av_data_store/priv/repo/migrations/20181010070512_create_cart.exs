defmodule AVDataStore.Repo.Migrations.CreateCart do
  use Ecto.Migration

  def change do
    create table(:sales_cart) do
      add :status, :string
      add :line_items, {:array, :map}
      add :from_date, :date
      add :to_date, :date
      add :subtotal, :decimal
      add :tax_cgst, :decimal
      add :tax_sgst, :decimal
      add :total, :decimal

      timestamps()
    end
  end
end
