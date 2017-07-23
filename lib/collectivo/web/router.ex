defmodule Collectivo.Web.Router do
  use Collectivo.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Collectivo.Web do
    pipe_through :api

    post "/session", SessionController, :create
    get "/page/:id", PageController, :show
  end

  scope "/", Collectivo.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Collectivo.Web do
  #   pipe_through :api
  # end
end
