defmodule MercuryWeb.Schema do
  use Absinthe.Schema

  alias MercuryWeb.Resolvers.User

  import_types MercuryWeb.Schemas.Types

  query do
    field :user, type: :user do
      arg :id, non_null(:id)

      resolve &User.get/2
    end

    mutation do
      field :create_user, :user do
        arg :username, non_null(:string)
        arg :email, non_null(:string)
        arg :name, non_null(:string)
        arg :bio, :string

        resolve &User.create/3
      end
    end
  end
end
