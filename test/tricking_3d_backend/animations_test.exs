defmodule Tricking3dBackend.AnimationsTest do
  use Tricking3dBackend.DataCase

  alias Tricking3dBackend.Animations

  describe "mocap_trickers" do
    alias Tricking3dBackend.Animations.MocapTricker

    import Tricking3dBackend.AnimationsFixtures

    @invalid_attrs %{dob: nil, first_name: nil, last_name: nil}

    test "list_mocap_trickers/0 returns all mocap_trickers" do
      mocap_tricker = mocap_tricker_fixture()
      assert Animations.list_mocap_trickers() == [mocap_tricker]
    end

    test "get_mocap_tricker!/1 returns the mocap_tricker with given id" do
      mocap_tricker = mocap_tricker_fixture()
      assert Animations.get_mocap_tricker!(mocap_tricker.id) == mocap_tricker
    end

    test "create_mocap_tricker/1 with valid data creates a mocap_tricker" do
      valid_attrs = %{dob: ~D[2022-04-23], first_name: "some first_name", last_name: "some last_name"}

      assert {:ok, %MocapTricker{} = mocap_tricker} = Animations.create_mocap_tricker(valid_attrs)
      assert mocap_tricker.dob == ~D[2022-04-23]
      assert mocap_tricker.first_name == "some first_name"
      assert mocap_tricker.last_name == "some last_name"
    end

    test "create_mocap_tricker/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Animations.create_mocap_tricker(@invalid_attrs)
    end

    test "update_mocap_tricker/2 with valid data updates the mocap_tricker" do
      mocap_tricker = mocap_tricker_fixture()
      update_attrs = %{dob: ~D[2022-04-24], first_name: "some updated first_name", last_name: "some updated last_name"}

      assert {:ok, %MocapTricker{} = mocap_tricker} = Animations.update_mocap_tricker(mocap_tricker, update_attrs)
      assert mocap_tricker.dob == ~D[2022-04-24]
      assert mocap_tricker.first_name == "some updated first_name"
      assert mocap_tricker.last_name == "some updated last_name"
    end

    test "update_mocap_tricker/2 with invalid data returns error changeset" do
      mocap_tricker = mocap_tricker_fixture()
      assert {:error, %Ecto.Changeset{}} = Animations.update_mocap_tricker(mocap_tricker, @invalid_attrs)
      assert mocap_tricker == Animations.get_mocap_tricker!(mocap_tricker.id)
    end

    test "delete_mocap_tricker/1 deletes the mocap_tricker" do
      mocap_tricker = mocap_tricker_fixture()
      assert {:ok, %MocapTricker{}} = Animations.delete_mocap_tricker(mocap_tricker)
      assert_raise Ecto.NoResultsError, fn -> Animations.get_mocap_tricker!(mocap_tricker.id) end
    end

    test "change_mocap_tricker/1 returns a mocap_tricker changeset" do
      mocap_tricker = mocap_tricker_fixture()
      assert %Ecto.Changeset{} = Animations.change_mocap_tricker(mocap_tricker)
    end
  end

  describe "models" do
    alias Tricking3dBackend.Animations.Model

    import Tricking3dBackend.AnimationsFixtures

    @invalid_attrs %{filepath: nil, name: nil}

    test "list_models/0 returns all models" do
      model = model_fixture()
      assert Animations.list_models() == [model]
    end

    test "get_model!/1 returns the model with given id" do
      model = model_fixture()
      assert Animations.get_model!(model.id) == model
    end

    test "create_model/1 with valid data creates a model" do
      valid_attrs = %{filepath: "some filepath", name: "some name"}

      assert {:ok, %Model{} = model} = Animations.create_model(valid_attrs)
      assert model.filepath == "some filepath"
      assert model.name == "some name"
    end

    test "create_model/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Animations.create_model(@invalid_attrs)
    end

    test "update_model/2 with valid data updates the model" do
      model = model_fixture()
      update_attrs = %{filepath: "some updated filepath", name: "some updated name"}

      assert {:ok, %Model{} = model} = Animations.update_model(model, update_attrs)
      assert model.filepath == "some updated filepath"
      assert model.name == "some updated name"
    end

    test "update_model/2 with invalid data returns error changeset" do
      model = model_fixture()
      assert {:error, %Ecto.Changeset{}} = Animations.update_model(model, @invalid_attrs)
      assert model == Animations.get_model!(model.id)
    end

    test "delete_model/1 deletes the model" do
      model = model_fixture()
      assert {:ok, %Model{}} = Animations.delete_model(model)
      assert_raise Ecto.NoResultsError, fn -> Animations.get_model!(model.id) end
    end

    test "change_model/1 returns a model changeset" do
      model = model_fixture()
      assert %Ecto.Changeset{} = Animations.change_model(model)
    end
  end

  describe "animations" do
    alias Tricking3dBackend.Animations.Animation

    import Tricking3dBackend.AnimationsFixtures

    @invalid_attrs %{name: nil}

    test "list_animations/0 returns all animations" do
      animation = animation_fixture()
      assert Animations.list_animations() == [animation]
    end

    test "get_animation!/1 returns the animation with given id" do
      animation = animation_fixture()
      assert Animations.get_animation!(animation.id) == animation
    end

    test "create_animation/1 with valid data creates a animation" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Animation{} = animation} = Animations.create_animation(valid_attrs)
      assert animation.name == "some name"
    end

    test "create_animation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Animations.create_animation(@invalid_attrs)
    end

    test "update_animation/2 with valid data updates the animation" do
      animation = animation_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Animation{} = animation} = Animations.update_animation(animation, update_attrs)
      assert animation.name == "some updated name"
    end

    test "update_animation/2 with invalid data returns error changeset" do
      animation = animation_fixture()
      assert {:error, %Ecto.Changeset{}} = Animations.update_animation(animation, @invalid_attrs)
      assert animation == Animations.get_animation!(animation.id)
    end

    test "delete_animation/1 deletes the animation" do
      animation = animation_fixture()
      assert {:ok, %Animation{}} = Animations.delete_animation(animation)
      assert_raise Ecto.NoResultsError, fn -> Animations.get_animation!(animation.id) end
    end

    test "change_animation/1 returns a animation changeset" do
      animation = animation_fixture()
      assert %Ecto.Changeset{} = Animations.change_animation(animation)
    end
  end
end
