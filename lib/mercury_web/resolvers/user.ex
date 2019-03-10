defmodule MercuryWeb.Resolvers.User do
  alias Mercury.Accounts
  alias Mercury.DataStorage.Errors.NotFound

  def get(%{id: id}, _info) do
    case Accounts.get_user(id) do
      %NotFound{message: message} -> {:error, message}
      user -> {:ok, user}
    end
  end

  def create(_root, params, _info) do
    Accounts.create_user(params)
  end
end
