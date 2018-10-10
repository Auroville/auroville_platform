defmodule AVPublic.Transport.VehicleControllerTest do
  use AVPublicWeb.ConnCase
  import AVPublic.Factory

  describe "search page" do
    test "display search form with to and from dates", %{conn: conn} do
      conn = get conn, transport_search_path(conn, :index)
      assert html_response(conn, 200) =~ "Book a Cycle"
    end

    test "display search results for the chosen dates", %{conn: conn} do
      [cycle1, cycle2] = insert_list(2, :transport_cycle)

      params = %{
        "from_date" => "",
        "to_date" => ""
      }

      conn = get conn, transport_search_path(conn, :index), search: params
      assert html_response(conn, 200) =~ "Book a Cycle"
      assert html_response(conn, 200) =~ cycle1.name
      assert html_response(conn, 200) =~ cycle2.name
    end

    test "display no results for the chosen dates when no vehicles available", %{conn: conn} do
      params = %{
        "from_date" => "",
        "to_date" => ""
      }
      conn = get conn, transport_search_path(conn, :index), search: params
      assert html_response(conn, 200) =~ "Book a Cycle"
      assert html_response(conn, 200) =~ "There are no vehicles matching your booking dates."
    end

  end

end
