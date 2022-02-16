defmodule Autocomplete.Repo do
  use Ecto.Repo,
    otp_app: :autocomplete,
    adapter: Ecto.Adapters.Postgres
end
