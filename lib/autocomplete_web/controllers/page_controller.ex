defmodule AutocompleteWeb.PageController do
  use AutocompleteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
