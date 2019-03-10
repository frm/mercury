defmodule Mercury.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(email name username)a
  @optional_fields ~w(bio)a

  @fields @required_fields ++ @optional_fields

  schema "users" do
    field :bio, :string
    field :email, :string
    field :name, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @fields)
    |> validate_required(@required_fields)
  end
end
