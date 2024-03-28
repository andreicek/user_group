defmodule UserGroup.Repo do
  use Ecto.Repo,
    otp_app: :user_group,
    adapter: Ecto.Adapters.Postgres
end
