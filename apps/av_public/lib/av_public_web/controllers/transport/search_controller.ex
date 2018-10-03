defmodule AVPublicWeb.Transport.SearchController do
  use AVPublicWeb, :controller

  alias AVDataStore.Transport
  alias AVDataStore.Transport.Vehicle

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, _params) do
    vehicles = Transport.list_vehicles
    render conn, "show.html", vehicles: vehicles
  end
end
