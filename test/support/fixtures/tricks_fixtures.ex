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
end
