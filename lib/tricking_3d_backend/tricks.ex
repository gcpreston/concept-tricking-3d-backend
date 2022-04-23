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
end
