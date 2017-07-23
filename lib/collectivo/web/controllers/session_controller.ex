defmodule Collectivo.Web.SessionController do
  use Collectivo.Web, :controller

  def create(conn, params) do
    if Enum.empty?(params) do
      IO.puts "The params are emtpy, request body not coming through"
      json conn, %{success: false, message: "got nothing"}
    else
      %{"email" => email, "password" => password} = params
      json conn, %{success: true, email: String.upcase(email), password: String.upcase(password)}
    end
  end
end
