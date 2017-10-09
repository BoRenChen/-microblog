defmodule Microblog.BlogTest do
  use Microblog.DataCase

  alias Microblog.Blog

  describe "statuses" do
    alias Microblog.Blog.Status

    @valid_attrs %{atTag: "some atTag", content: "some content", crcreateBy: "some crcreateBy", hashTag: "some hashTag", like: "120.5"}
    @update_attrs %{atTag: "some updated atTag", content: "some updated content", crcreateBy: "some updated crcreateBy", hashTag: "some updated hashTag", like: "456.7"}
    @invalid_attrs %{atTag: nil, content: nil, crcreateBy: nil, hashTag: nil, like: nil}

    def status_fixture(attrs \\ %{}) do
      {:ok, status} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_status()

      status
    end

    test "list_statuses/0 returns all statuses" do
      status = status_fixture()
      assert Blog.list_statuses() == [status]
    end

    test "get_status!/1 returns the status with given id" do
      status = status_fixture()
      assert Blog.get_status!(status.id) == status
    end

    test "create_status/1 with valid data creates a status" do
      assert {:ok, %Status{} = status} = Blog.create_status(@valid_attrs)
      assert status.atTag == "some atTag"
      assert status.content == "some content"
      assert status.crcreateBy == "some crcreateBy"
      assert status.hashTag == "some hashTag"
      assert status.like == Decimal.new("120.5")
    end

    test "create_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_status(@invalid_attrs)
    end

    test "update_status/2 with valid data updates the status" do
      status = status_fixture()
      assert {:ok, status} = Blog.update_status(status, @update_attrs)
      assert %Status{} = status
      assert status.atTag == "some updated atTag"
      assert status.content == "some updated content"
      assert status.crcreateBy == "some updated crcreateBy"
      assert status.hashTag == "some updated hashTag"
      assert status.like == Decimal.new("456.7")
    end

    test "update_status/2 with invalid data returns error changeset" do
      status = status_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_status(status, @invalid_attrs)
      assert status == Blog.get_status!(status.id)
    end

    test "delete_status/1 deletes the status" do
      status = status_fixture()
      assert {:ok, %Status{}} = Blog.delete_status(status)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_status!(status.id) end
    end

    test "change_status/1 returns a status changeset" do
      status = status_fixture()
      assert %Ecto.Changeset{} = Blog.change_status(status)
    end
  end

  describe "statuses" do
    alias Microblog.Blog.Status

    @valid_attrs %{atTag: "some atTag", content: "some content", createBy: "some createBy", hashTag: "some hashTag", like: "120.5"}
    @update_attrs %{atTag: "some updated atTag", content: "some updated content", createBy: "some updated createBy", hashTag: "some updated hashTag", like: "456.7"}
    @invalid_attrs %{atTag: nil, content: nil, createBy: nil, hashTag: nil, like: nil}

    def status_fixture(attrs \\ %{}) do
      {:ok, status} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_status()

      status
    end

    test "list_statuses/0 returns all statuses" do
      status = status_fixture()
      assert Blog.list_statuses() == [status]
    end

    test "get_status!/1 returns the status with given id" do
      status = status_fixture()
      assert Blog.get_status!(status.id) == status
    end

    test "create_status/1 with valid data creates a status" do
      assert {:ok, %Status{} = status} = Blog.create_status(@valid_attrs)
      assert status.atTag == "some atTag"
      assert status.content == "some content"
      assert status.createBy == "some createBy"
      assert status.hashTag == "some hashTag"
      assert status.like == Decimal.new("120.5")
    end

    test "create_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_status(@invalid_attrs)
    end

    test "update_status/2 with valid data updates the status" do
      status = status_fixture()
      assert {:ok, status} = Blog.update_status(status, @update_attrs)
      assert %Status{} = status
      assert status.atTag == "some updated atTag"
      assert status.content == "some updated content"
      assert status.createBy == "some updated createBy"
      assert status.hashTag == "some updated hashTag"
      assert status.like == Decimal.new("456.7")
    end

    test "update_status/2 with invalid data returns error changeset" do
      status = status_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_status(status, @invalid_attrs)
      assert status == Blog.get_status!(status.id)
    end

    test "delete_status/1 deletes the status" do
      status = status_fixture()
      assert {:ok, %Status{}} = Blog.delete_status(status)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_status!(status.id) end
    end

    test "change_status/1 returns a status changeset" do
      status = status_fixture()
      assert %Ecto.Changeset{} = Blog.change_status(status)
    end
  end

  describe "users" do
    alias Microblog.Blog.User

    @valid_attrs %{email: "some email", firstName: "some firstName", lastName: "some lastName"}
    @update_attrs %{email: "some updated email", firstName: "some updated firstName", lastName: "some updated lastName"}
    @invalid_attrs %{email: nil, firstName: nil, lastName: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Blog.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Blog.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Blog.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.firstName == "some firstName"
      assert user.lastName == "some lastName"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Blog.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.firstName == "some updated firstName"
      assert user.lastName == "some updated lastName"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_user(user, @invalid_attrs)
      assert user == Blog.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Blog.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Blog.change_user(user)
    end
  end

  describe "follows" do
    alias Microblog.Blog.Follow

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def follow_fixture(attrs \\ %{}) do
      {:ok, follow} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_follow()

      follow
    end

    test "list_follows/0 returns all follows" do
      follow = follow_fixture()
      assert Blog.list_follows() == [follow]
    end

    test "get_follow!/1 returns the follow with given id" do
      follow = follow_fixture()
      assert Blog.get_follow!(follow.id) == follow
    end

    test "create_follow/1 with valid data creates a follow" do
      assert {:ok, %Follow{} = follow} = Blog.create_follow(@valid_attrs)
    end

    test "create_follow/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_follow(@invalid_attrs)
    end

    test "update_follow/2 with valid data updates the follow" do
      follow = follow_fixture()
      assert {:ok, follow} = Blog.update_follow(follow, @update_attrs)
      assert %Follow{} = follow
    end

    test "update_follow/2 with invalid data returns error changeset" do
      follow = follow_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_follow(follow, @invalid_attrs)
      assert follow == Blog.get_follow!(follow.id)
    end

    test "delete_follow/1 deletes the follow" do
      follow = follow_fixture()
      assert {:ok, %Follow{}} = Blog.delete_follow(follow)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_follow!(follow.id) end
    end

    test "change_follow/1 returns a follow changeset" do
      follow = follow_fixture()
      assert %Ecto.Changeset{} = Blog.change_follow(follow)
    end
  end
end
