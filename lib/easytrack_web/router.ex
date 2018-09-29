defmodule EasytrackWeb.Router do
  use EasytrackWeb, :router

  def assign_subdomain(conn, _) do
    hostSplitted = String.split(conn.host, ".")
    conn
      |> put_private(:subdomain, (if length(hostSplitted) > 3, do: List.first(String.split(conn.host, ".")), else: nil))
  end


  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :assign_subdomain
  end



  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EasytrackWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", EasytrackWeb do
  #   pipe_through :api
  # end
end
