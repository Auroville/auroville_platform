defmodule AVPublicWeb.Transport.SearchController do
  use AVPublicWeb, :controller

  alias AVDataStore.Transport
  alias AVDataStore.Transport.Vehicle

  def index(conn, %{"search" => search_params}) do
    vehicles = Transport.list_vehicles
    render conn, "index.html", vehicles: vehicles
  end

  def index(conn, _params) do
    render conn, "index.html", vehicles: nil
  end

end
