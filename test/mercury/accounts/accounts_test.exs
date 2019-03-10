defmodule Mercury.AccountsTest do
  use Mercury.DataCase

  alias Mercury.Accounts
  alias Mercury.DataStorage.Errors.NotFound

  describe "users" do
    alias Mercury.Accounts.User

    test "list_users/0 returns all users" do
      users = insert_list(3, :user)

      assert Accounts.list_users() == users
    end

    test "get_user!/1 returns the user with given id" do
      user = insert(:user)

      assert Accounts.get_user!(user.id) == user
    end

    test "get_user/1 returns the user with given id" do
      user = insert(:user)

      assert Accounts.get_user(user.id) == user
    end

    test "get_user/1 returns %NotFound{} if no user exists" do
      assert %NotFound{} = Accounts.get_user(1)
    end

    test "create_user/1 with valid data creates a user" do
      user_attrs = params_for(:user)

      {:ok, %User{} = user} = Accounts.create_user(user_attrs)

      assert user.bio == user_attrs.bio
      assert user.email == user_attrs.email
      assert user.name == user_attrs.name
      assert user.username == user_attrs.username
    end

    test "create_user/1 with invalid data returns error changeset" do
      user_attrs = params_for(:user, username: nil)

      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(user_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = insert(:user)
      attrs = %{username: "new-username"}

      {:ok, %User{} = updated_user} = Accounts.update_user(user, attrs)

      assert updated_user.username == "new-username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = insert(:user)

      assert {:error, %Ecto.Changeset{}} =
               Accounts.update_user(user, %{username: nil})

      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = insert(:user)

      {:ok, %User{}} = Accounts.delete_user(user)

      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = insert(:user)

      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
