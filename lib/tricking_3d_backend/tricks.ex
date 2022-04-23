defmodule Tricking3dBackend.Tricks do
  @moduledoc """
  The Tricks context.
  """

  import Ecto.Query, warn: false
  alias Tricking3dBackend.Repo

  alias Tricking3dBackend.Tricks.Trick

  @doc """
  Returns the list of tricks.

  ## Examples

      iex> list_tricks()
      [%Trick{}, ...]

  """
  def list_tricks do
    Repo.all(Trick)
  end

  @doc """
  Gets a single trick.

  Raises `Ecto.NoResultsError` if the Trick does not exist.

  ## Examples

      iex> get_trick!(123)
      %Trick{}

      iex> get_trick!(456)
      ** (Ecto.NoResultsError)

  """
  def get_trick!(id), do: Repo.get!(Trick, id)

  @doc """
  Creates a trick.

  ## Examples

      iex> create_trick(%{field: value})
      {:ok, %Trick{}}

      iex> create_trick(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_trick(attrs \\ %{}) do
    %Trick{}
    |> Trick.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a trick.

  ## Examples

      iex> update_trick(trick, %{field: new_value})
      {:ok, %Trick{}}

      iex> update_trick(trick, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_trick(%Trick{} = trick, attrs) do
    trick
    |> Trick.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a trick.

  ## Examples

      iex> delete_trick(trick)
      {:ok, %Trick{}}

      iex> delete_trick(trick)
      {:error, %Ecto.Changeset{}}

  """
  def delete_trick(%Trick{} = trick) do
    Repo.delete(trick)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking trick changes.

  ## Examples

      iex> change_trick(trick)
      %Ecto.Changeset{data: %Trick{}}

  """
  def change_trick(%Trick{} = trick, attrs \\ %{}) do
    Trick.changeset(trick, attrs)
  end

  alias Tricking3dBackend.Tricks.Stance

  @doc """
  Returns the list of stances.

  ## Examples

      iex> list_stances()
      [%Stance{}, ...]

  """
  def list_stances do
    Repo.all(Stance)
  end

  @doc """
  Gets a single stance.

  Raises `Ecto.NoResultsError` if the Stance does not exist.

  ## Examples

      iex> get_stance!(123)
      %Stance{}

      iex> get_stance!(456)
      ** (Ecto.NoResultsError)

  """
  def get_stance!(id), do: Repo.get!(Stance, id)

  @doc """
  Creates a stance.

  ## Examples

      iex> create_stance(%{field: value})
      {:ok, %Stance{}}

      iex> create_stance(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stance(attrs \\ %{}) do
    %Stance{}
    |> Stance.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a stance.

  ## Examples

      iex> update_stance(stance, %{field: new_value})
      {:ok, %Stance{}}

      iex> update_stance(stance, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_stance(%Stance{} = stance, attrs) do
    stance
    |> Stance.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a stance.

  ## Examples

      iex> delete_stance(stance)
      {:ok, %Stance{}}

      iex> delete_stance(stance)
      {:error, %Ecto.Changeset{}}

  """
  def delete_stance(%Stance{} = stance) do
    Repo.delete(stance)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking stance changes.

  ## Examples

      iex> change_stance(stance)
      %Ecto.Changeset{data: %Stance{}}

  """
  def change_stance(%Stance{} = stance, attrs \\ %{}) do
    Stance.changeset(stance, attrs)
  end

  alias Tricking3dBackend.Tricks.TrickStance

  @doc """
  Returns the list of trick_stances.

  ## Examples

      iex> list_trick_stances()
      [%TrickStance{}, ...]

  """
  def list_trick_stances do
    Repo.all(TrickStance)
  end

  @doc """
  Gets a single trick_stance.

  Raises `Ecto.NoResultsError` if the Trick stance does not exist.

  ## Examples

      iex> get_trick_stance!(123)
      %TrickStance{}

      iex> get_trick_stance!(456)
      ** (Ecto.NoResultsError)

  """
  def get_trick_stance!(id), do: Repo.get!(TrickStance, id)

  @doc """
  Creates a trick_stance.

  ## Examples

      iex> create_trick_stance(%{field: value})
      {:ok, %TrickStance{}}

      iex> create_trick_stance(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_trick_stance(attrs \\ %{}) do
    %TrickStance{}
    |> TrickStance.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a trick_stance.

  ## Examples

      iex> update_trick_stance(trick_stance, %{field: new_value})
      {:ok, %TrickStance{}}

      iex> update_trick_stance(trick_stance, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_trick_stance(%TrickStance{} = trick_stance, attrs) do
    trick_stance
    |> TrickStance.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a trick_stance.

  ## Examples

      iex> delete_trick_stance(trick_stance)
      {:ok, %TrickStance{}}

      iex> delete_trick_stance(trick_stance)
      {:error, %Ecto.Changeset{}}

  """
  def delete_trick_stance(%TrickStance{} = trick_stance) do
    Repo.delete(trick_stance)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking trick_stance changes.

  ## Examples

      iex> change_trick_stance(trick_stance)
      %Ecto.Changeset{data: %TrickStance{}}

  """
  def change_trick_stance(%TrickStance{} = trick_stance, attrs \\ %{}) do
    TrickStance.changeset(trick_stance, attrs)
  end
end
