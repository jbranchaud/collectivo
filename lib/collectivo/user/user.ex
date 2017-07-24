defmodule Collectivo.User do
  @moduledoc """
  The boundary for the User system.
  """

  # import Ecto.{Query, Changeset}, warn: false
  # alias Collectivo.Repo

  alias Collectivo.User.Account

  def find_account(email, password) do
    if password == "password" do
      %Account{email: email}
    else
      nil
    end
  end
end
