defmodule UserGroupWeb.Router do
  use UserGroupWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {UserGroupWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", UserGroupWeb do
    pipe_through :browser

    live "/", Live.Home.Index, :index
  end
end
