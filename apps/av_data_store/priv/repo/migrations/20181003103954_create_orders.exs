defmodule AVDataStore.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:sales_orders) do
      add :status, :string
      add :line_items, {:array, :map}
      add :from_date, :date
      add :to_date, :date
      add :subtotal, :decimal
      add :tax_cgst, :decimal
      add :tax_sgst, :decimal
      add :total, :decimal
      add :name, :string
      add :email, :string
      add :uuid, :text
      add :id_type, :string
      add :id_value, :string
      add :contact_number, :string
      add :user_status, :string

      timestamps()
    end

  end
end
