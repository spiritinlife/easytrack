defmodule EasytrackWeb.PageController do
  use EasytrackWeb, :controller

  def index(conn, _params) do
    subdomain =
      case conn.private[:subdomain] do
        nil -> ""
        _ -> conn.private[:subdomain]
      end

    conn
    |> assign(:subdomain, subdomain)
    |> render((if subdomain === "", do: "index.html", else: "maps.html"))
  end
end
