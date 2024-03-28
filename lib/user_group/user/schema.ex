defmodule UserGroup.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field :email, :string

    timestamps()
  end

  def changeset(attrs), do: changeset(%__MODULE__{}, attrs)

  def changeset(user, attrs) do
    user
    |> cast(attrs, ~w(email)a)
    |> validate_required(~w(email)a)
    |> unique_constraint(:email)
  end
end
