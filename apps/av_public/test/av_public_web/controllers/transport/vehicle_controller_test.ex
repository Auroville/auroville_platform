defmodule AVPublic.Transport.VehicleControllerTest do
  use AVPublicWeb.ConnCase
  import AVPublic.Factory

  describe "search page" do
    test "display search form with to and from dates", %{conn: conn} do
      conn = get conn, search_path(conn, :index)
      assert html_response(conn, 200) =~ "Book a cycle"
    end
  end
  
end
