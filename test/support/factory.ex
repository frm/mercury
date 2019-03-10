defmodule Mercury.Factory do
  use ExMachina.Ecto, repo: Mercury.Repo

  alias Mercury.Accounts.User

  def user_factory do
    %User{
      username: Faker.Internet.user_name(),
      name: Faker.Name.name(),
      email: Faker.Internet.safe_email(),
      bio: Faker.StarWars.quote()
    }
  end
end
