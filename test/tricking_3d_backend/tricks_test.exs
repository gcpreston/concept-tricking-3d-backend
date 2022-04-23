defmodule Tricking3dBackend.TricksTest do
  use Tricking3dBackend.DataCase

  alias Tricking3dBackend.Tricks

  describe "tricks" do
    alias Tricking3dBackend.Tricks.Trick

    import Tricking3dBackend.TricksFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_tricks/0 returns all tricks" do
      trick = trick_fixture()
      assert Tricks.list_tricks() == [trick]
    end

    test "get_trick!/1 returns the trick with given id" do
      trick = trick_fixture()
      assert Tricks.get_trick!(trick.id) == trick
    end

    test "create_trick/1 with valid data creates a trick" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %Trick{} = trick} = Tricks.create_trick(valid_attrs)
      assert trick.description == "some description"
      assert trick.name == "some name"
    end

    test "create_trick/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tricks.create_trick(@invalid_attrs)
    end

    test "update_trick/2 with valid data updates the trick" do
      trick = trick_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %Trick{} = trick} = Tricks.update_trick(trick, update_attrs)
      assert trick.description == "some updated description"
      assert trick.name == "some updated name"
    end

    test "update_trick/2 with invalid data returns error changeset" do
      trick = trick_fixture()
      assert {:error, %Ecto.Changeset{}} = Tricks.update_trick(trick, @invalid_attrs)
      assert trick == Tricks.get_trick!(trick.id)
    end

    test "delete_trick/1 deletes the trick" do
      trick = trick_fixture()
      assert {:ok, %Trick{}} = Tricks.delete_trick(trick)
      assert_raise Ecto.NoResultsError, fn -> Tricks.get_trick!(trick.id) end
    end

    test "change_trick/1 returns a trick changeset" do
      trick = trick_fixture()
      assert %Ecto.Changeset{} = Tricks.change_trick(trick)
    end
  end
end
