defmodule MercuryWeb.Schemas.Types do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
    field :name, :string
    field :username, :string
    field :email, :string
    field :bio, :string
  end
end
