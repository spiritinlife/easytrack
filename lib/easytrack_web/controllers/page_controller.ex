defmodule EasytrackWeb.PageController do
  use EasytrackWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
