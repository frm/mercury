defmodule MercuryWeb.Schema do
  use Absinthe.Schema

  alias Mercury.Accounts.UserResolver

  import_types MercuryWeb.Schemas.Types

  query do
    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &UserResolver.get/2
    end
  end
end
