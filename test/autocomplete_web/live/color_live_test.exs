defmodule AutocompleteWeb.ColorLiveTest do
  use AutocompleteWeb.ConnCase

  import Phoenix.LiveViewTest
  import Autocomplete.ColorsFixtures

  @create_attrs %{color: "some color"}
  @update_attrs %{color: "some updated color"}
  @invalid_attrs %{color: nil}

  defp create_color(_) do
    color = color_fixture()
    %{color: color}
  end

  describe "Index" do
    setup [:create_color]

    test "lists all colors", %{conn: conn, color: color} do
      {:ok, _index_live, html} = live(conn, Routes.color_index_path(conn, :index))

      assert html =~ "Listing Colors"
      assert html =~ color.color
    end

    test "saves new color", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.color_index_path(conn, :index))

      assert index_live |> element("a", "New Color") |> render_click() =~
               "New Color"

      assert_patch(index_live, Routes.color_index_path(conn, :new))

      assert index_live
             |> form("#color-form", color: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#color-form", color: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.color_index_path(conn, :index))

      assert html =~ "Color created successfully"
      assert html =~ "some color"
    end

    test "updates color in listing", %{conn: conn, color: color} do
      {:ok, index_live, _html} = live(conn, Routes.color_index_path(conn, :index))

      assert index_live |> element("#color-#{color.id} a", "Edit") |> render_click() =~
               "Edit Color"

      assert_patch(index_live, Routes.color_index_path(conn, :edit, color))

      assert index_live
             |> form("#color-form", color: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#color-form", color: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.color_index_path(conn, :index))

      assert html =~ "Color updated successfully"
      assert html =~ "some updated color"
    end

    test "deletes color in listing", %{conn: conn, color: color} do
      {:ok, index_live, _html} = live(conn, Routes.color_index_path(conn, :index))

      assert index_live |> element("#color-#{color.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#color-#{color.id}")
    end
  end

  describe "Show" do
    setup [:create_color]

    test "displays color", %{conn: conn, color: color} do
      {:ok, _show_live, html} = live(conn, Routes.color_show_path(conn, :show, color))

      assert html =~ "Show Color"
      assert html =~ color.color
    end

    test "updates color within modal", %{conn: conn, color: color} do
      {:ok, show_live, _html} = live(conn, Routes.color_show_path(conn, :show, color))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Color"

      assert_patch(show_live, Routes.color_show_path(conn, :edit, color))

      assert show_live
             |> form("#color-form", color: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#color-form", color: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.color_show_path(conn, :show, color))

      assert html =~ "Color updated successfully"
      assert html =~ "some updated color"
    end
  end
end
