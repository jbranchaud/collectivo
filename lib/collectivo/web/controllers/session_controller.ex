defmodule Collectivo.Web.SessionController do
  use Collectivo.Web, :controller

  alias Collectivo.User
  alias Collectivo.User.Account

  def create(conn, params) do
    case params do
      %{"email" => email, "password" => password} ->
        case User.find_account(email, password) do
          %Account{} ->
            json conn, %{success: true}
          _ ->
            json conn, %{success: false}
        end
      _ ->
        json conn, %{success: false}
    end
  end
end
