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

  describe "stances" do
    alias Tricking3dBackend.Tricks.Stance

    import Tricking3dBackend.TricksFixtures

    @invalid_attrs %{description: nil, direction: nil, name: nil, plant_foot: nil}

    test "list_stances/0 returns all stances" do
      stance = stance_fixture()
      assert Tricks.list_stances() == [stance]
    end

    test "get_stance!/1 returns the stance with given id" do
      stance = stance_fixture()
      assert Tricks.get_stance!(stance.id) == stance
    end

    test "create_stance/1 with valid data creates a stance" do
      valid_attrs = %{
        description: "some description",
        direction: "some direction",
        name: "some name",
        plant_foot: "some plant_foot"
      }

      assert {:ok, %Stance{} = stance} = Tricks.create_stance(valid_attrs)
      assert stance.description == "some description"
      assert stance.direction == "some direction"
      assert stance.name == "some name"
      assert stance.plant_foot == "some plant_foot"
    end

    test "create_stance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tricks.create_stance(@invalid_attrs)
    end

    test "update_stance/2 with valid data updates the stance" do
      stance = stance_fixture()

      update_attrs = %{
        description: "some updated description",
        direction: "some updated direction",
        name: "some updated name",
        plant_foot: "some updated plant_foot"
      }

      assert {:ok, %Stance{} = stance} = Tricks.update_stance(stance, update_attrs)
      assert stance.description == "some updated description"
      assert stance.direction == "some updated direction"
      assert stance.name == "some updated name"
      assert stance.plant_foot == "some updated plant_foot"
    end

    test "update_stance/2 with invalid data returns error changeset" do
      stance = stance_fixture()
      assert {:error, %Ecto.Changeset{}} = Tricks.update_stance(stance, @invalid_attrs)
      assert stance == Tricks.get_stance!(stance.id)
    end

    test "delete_stance/1 deletes the stance" do
      stance = stance_fixture()
      assert {:ok, %Stance{}} = Tricks.delete_stance(stance)
      assert_raise Ecto.NoResultsError, fn -> Tricks.get_stance!(stance.id) end
    end

    test "change_stance/1 returns a stance changeset" do
      stance = stance_fixture()
      assert %Ecto.Changeset{} = Tricks.change_stance(stance)
    end
  end

  describe "trick_stances" do
    alias Tricking3dBackend.Tricks.TrickStance

    import Tricking3dBackend.TricksFixtures

    @invalid_attrs %{trick_id: nil, stance_id: nil}

    test "list_trick_stances/0 returns all trick_stances" do
      trick_stance = trick_stance_fixture()
      assert Tricks.list_trick_stances() == [trick_stance]
    end

    test "get_trick_stance!/1 returns the trick_stance with given id" do
      trick_stance = trick_stance_fixture()
      assert Tricks.get_trick_stance!(trick_stance.id) == trick_stance
    end

    test "create_trick_stance/1 with valid data creates a trick_stance" do
      trick = trick_fixture()
      stance = stance_fixture()
      valid_attrs = %{trick_id: trick.id, stance_id: stance.id}

      assert {:ok, %TrickStance{} = trick_stance} = Tricks.create_trick_stance(valid_attrs)
      assert trick_stance.trick_id == trick.id
      assert trick_stance.stance_id == stance.id
    end

    test "create_trick_stance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tricks.create_trick_stance(@invalid_attrs)
    end

    test "update_trick_stance/2 with valid data updates the trick_stance" do
      trick_stance = trick_stance_fixture()
      new_stance = stance_fixture()
      update_attrs = %{stance_id: new_stance.id}

      assert {:ok, %TrickStance{} = trick_stance} =
               Tricks.update_trick_stance(trick_stance, update_attrs)
      assert trick_stance.stance_id == new_stance.id
    end

    test "update_trick_stance/2 with invalid data returns error changeset" do
      trick_stance = trick_stance_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Tricks.update_trick_stance(trick_stance, @invalid_attrs)

      assert trick_stance == Tricks.get_trick_stance!(trick_stance.id)
    end

    test "delete_trick_stance/1 deletes the trick_stance" do
      trick_stance = trick_stance_fixture()
      assert {:ok, %TrickStance{}} = Tricks.delete_trick_stance(trick_stance)
      assert_raise Ecto.NoResultsError, fn -> Tricks.get_trick_stance!(trick_stance.id) end
    end

    test "change_trick_stance/1 returns a trick_stance changeset" do
      trick_stance = trick_stance_fixture()
      assert %Ecto.Changeset{} = Tricks.change_trick_stance(trick_stance)
    end
  end
end
