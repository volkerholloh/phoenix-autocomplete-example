defmodule Autocomplete.Colors.Color do
  use Ecto.Schema
  import Ecto.Changeset

  schema "colors" do
    field :color, :string

    timestamps()
  end

  @doc false
  def changeset(color, attrs) do
    color
    |> cast(attrs, [:color])
    |> validate_required([:color])
  end
end
