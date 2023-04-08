defmodule K8xWeb.ErrorJSONTest do
  use K8xWeb.ConnCase, async: true

  test "renders 404" do
    assert K8xWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert K8xWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
