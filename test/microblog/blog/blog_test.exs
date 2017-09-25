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
end
