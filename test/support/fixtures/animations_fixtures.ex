defmodule Tricking3dBackend.AnimationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tricking3dBackend.Animations` context.
  """

  @doc """
  Generate a mocap_tricker.
  """
  def mocap_tricker_fixture(attrs \\ %{}) do
    {:ok, mocap_tricker} =
      attrs
      |> Enum.into(%{
        dob: ~D[2022-04-23],
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> Tricking3dBackend.Animations.create_mocap_tricker()

    mocap_tricker
  end

  @doc """
  Generate a model.
  """
  def model_fixture(attrs \\ %{}) do
    {:ok, model} =
      attrs
      |> Enum.into(%{
        filepath: "some filepath",
        name: "some name"
      })
      |> Tricking3dBackend.Animations.create_model()

    model
  end
end
