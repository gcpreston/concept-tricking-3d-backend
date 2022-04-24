defmodule Tricking3dBackend.Animations do
  @moduledoc """
  The Animations context.
  """

  import Ecto.Query, warn: false
  alias Tricking3dBackend.Repo

  alias Tricking3dBackend.Animations.MocapTricker

  @doc """
  Returns the list of mocap_trickers.

  ## Examples

      iex> list_mocap_trickers()
      [%MocapTricker{}, ...]

  """
  def list_mocap_trickers do
    Repo.all(MocapTricker)
  end

  @doc """
  Gets a single mocap_tricker.

  Raises `Ecto.NoResultsError` if the Mocap tricker does not exist.

  ## Examples

      iex> get_mocap_tricker!(123)
      %MocapTricker{}

      iex> get_mocap_tricker!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mocap_tricker!(id), do: Repo.get!(MocapTricker, id)

  @doc """
  Creates a mocap_tricker.

  ## Examples

      iex> create_mocap_tricker(%{field: value})
      {:ok, %MocapTricker{}}

      iex> create_mocap_tricker(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mocap_tricker(attrs \\ %{}) do
    %MocapTricker{}
    |> MocapTricker.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mocap_tricker.

  ## Examples

      iex> update_mocap_tricker(mocap_tricker, %{field: new_value})
      {:ok, %MocapTricker{}}

      iex> update_mocap_tricker(mocap_tricker, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mocap_tricker(%MocapTricker{} = mocap_tricker, attrs) do
    mocap_tricker
    |> MocapTricker.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a mocap_tricker.

  ## Examples

      iex> delete_mocap_tricker(mocap_tricker)
      {:ok, %MocapTricker{}}

      iex> delete_mocap_tricker(mocap_tricker)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mocap_tricker(%MocapTricker{} = mocap_tricker) do
    Repo.delete(mocap_tricker)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mocap_tricker changes.

  ## Examples

      iex> change_mocap_tricker(mocap_tricker)
      %Ecto.Changeset{data: %MocapTricker{}}

  """
  def change_mocap_tricker(%MocapTricker{} = mocap_tricker, attrs \\ %{}) do
    MocapTricker.changeset(mocap_tricker, attrs)
  end

  alias Tricking3dBackend.Animations.Model

  @doc """
  Returns the list of models.

  ## Examples

      iex> list_models()
      [%Model{}, ...]

  """
  def list_models do
    Repo.all(Model)
  end

  @doc """
  Gets a single model.

  Raises `Ecto.NoResultsError` if the Model does not exist.

  ## Examples

      iex> get_model!(123)
      %Model{}

      iex> get_model!(456)
      ** (Ecto.NoResultsError)

  """
  def get_model!(id), do: Repo.get!(Model, id)

  @doc """
  Creates a model.

  ## Examples

      iex> create_model(%{field: value})
      {:ok, %Model{}}

      iex> create_model(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_model(attrs \\ %{}) do
    %Model{}
    |> Model.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a model.

  ## Examples

      iex> update_model(model, %{field: new_value})
      {:ok, %Model{}}

      iex> update_model(model, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_model(%Model{} = model, attrs) do
    model
    |> Model.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a model.

  ## Examples

      iex> delete_model(model)
      {:ok, %Model{}}

      iex> delete_model(model)
      {:error, %Ecto.Changeset{}}

  """
  def delete_model(%Model{} = model) do
    Repo.delete(model)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking model changes.

  ## Examples

      iex> change_model(model)
      %Ecto.Changeset{data: %Model{}}

  """
  def change_model(%Model{} = model, attrs \\ %{}) do
    Model.changeset(model, attrs)
  end
end
