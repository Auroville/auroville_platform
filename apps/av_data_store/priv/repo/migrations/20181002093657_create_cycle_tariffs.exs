defmodule AvDataStore.Repo.Migrations.CreateCycleTariffs do
  use Ecto.Migration

  def change do
    create table(:transport_cycle_tariffs) do
      add :price, :decimal
      add :status, :string
      add :duration, :integer

      timestamps()
    end

  end
end
