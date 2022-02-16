defmodule AutocompleteWeb.ColorLive.Show do
  use AutocompleteWeb, :live_view

  alias Autocomplete.Colors

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:color, Colors.get_color!(id))}
  end

  defp page_title(:show), do: "Show Color"
  defp page_title(:edit), do: "Edit Color"
end
