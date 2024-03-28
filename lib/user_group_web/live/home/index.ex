defmodule UserGroupWeb.Live.Home.Index do
  use UserGroupWeb, :live_view

  alias UserGroup.User

  def mount(_params, _session, socket), do: {:ok, socket}

  def handle_params(_params, _url, socket) do
    form = User.UseCase.new()

    {:noreply, assign(socket, form: form)}
  end

  def handle_event("validate", %{"user" => params}, socket) do
    form =
      params
      |> User.changeset()
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, form: form)}
  end

  def handle_event("submit", %{"user" => params}, socket) do
    socket =
      with {:ok, _user} <- User.UseCase.create(params) do
        form = User.UseCase.new()

        socket
        |> assign(form: form)
        |> put_flash(:info, "Registration successful!")
      else
        {:error, changeset} ->
          form = Map.put(changeset, :action, :validate)

          assign(socket, form: form)
      end

    {:noreply, socket}
  end
end
