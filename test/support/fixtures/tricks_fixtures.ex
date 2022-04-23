defmodule Tricking3dBackend.TricksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tricking3dBackend.Tricks` context.
  """

  @doc """
  Generate a trick.
  """
  def trick_fixture(attrs \\ %{}) do
    {:ok, trick} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> Tricking3dBackend.Tricks.create_trick()

    trick
  end

  @doc """
  Generate a stance.
  """
  def stance_fixture(attrs \\ %{}) do
    {:ok, stance} =
      attrs
      |> Enum.into(%{
        description: "some description",
        direction: "some direction",
        name: "some name",
        plant_foot: "some plant_foot"
      })
      |> Tricking3dBackend.Tricks.create_stance()

    stance
  end

  @doc """
  Generate a trick_stance.
  """
  def trick_stance_fixture(attrs \\ %{}) do
    trick = trick_fixture()
    stance = stance_fixture()

    {:ok, trick_stance} =
      attrs
      |> Enum.into(%{
        trick_id: trick.id,
        stance_id: stance.id
      })
      |> Tricking3dBackend.Tricks.create_trick_stance()

    trick_stance
  end
end
