defmodule Collectivo.Web.PageView do
  use Collectivo.Web, :view

  def render("show.json", %{id: id}) do
    %{data: %{id: id, hello: "world"}}
  end
end
