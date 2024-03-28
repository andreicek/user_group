defmodule UserGroup.User.UseCase do
  alias UserGroup.{User, Repo}

  def new, do: User.changeset(%{})

  def create(params) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert()
  end
end
