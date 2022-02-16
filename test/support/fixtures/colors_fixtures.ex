defmodule Autocomplete.ColorsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Autocomplete.Colors` context.
  """

  @doc """
  Generate a color.
  """
  def color_fixture(attrs \\ %{}) do
    {:ok, color} =
      attrs
      |> Enum.into(%{
        color: "some color"
      })
      |> Autocomplete.Colors.create_color()

    color
  end
end
