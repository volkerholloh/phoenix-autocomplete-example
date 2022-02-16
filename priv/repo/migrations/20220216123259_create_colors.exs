defmodule Autocomplete.Repo.Migrations.CreateColors do
  use Ecto.Migration

  def change do
    create table(:colors) do
      add :color, :string

      timestamps()
    end
  end
end
