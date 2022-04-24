# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tricking3dBackend.Repo.insert!(%Tricking3dBackend.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Tricking3dBackend.Repo

## Tricks

alias Tricking3dBackend.Tricks
alias Tricking3dBackend.Tricks.{Trick, TrickStance, Stance}

Repo.delete_all(Trick)
{:ok, cork} = Tricks.create_trick(%{name: "cork", description: "todo"})
{:ok, raiz} = Tricks.create_trick(%{name: "raiz", description: "todo"})
{:ok, btwist} = Tricks.create_trick(%{name: "butterfly kick", description: "todo"})

Repo.delete_all(Stance)
{:ok, complete} = Tricks.create_stance(%{name: "complete", description: "todo", direction: :backward, plant_foot: :left})
{:ok, mega} = Tricks.create_stance(%{name: "mega", description: "todo", direction: :forward, plant_foot: :left})
{:ok, hyper} = Tricks.create_stance(%{name: "hyper", description: "todo", direction: :forward, plant_foot: :right})
{:ok, _semi} = Tricks.create_stance(%{name: "semi", description: "todo", direction: :forward, plant_foot: :right})

Repo.delete_all(TrickStance)
Tricks.create_trick_stance(%{trick_id: cork.id, stance_id: complete.id})
Tricks.create_trick_stance(%{trick_id: cork.id, stance_id: hyper.id})
Tricks.create_trick_stance(%{trick_id: raiz.id, stance_id: complete.id})
Tricks.create_trick_stance(%{trick_id: raiz.id, stance_id: mega.id})

## Animations

alias Tricking3dBackend.Animations
alias Tricking3dBackend.Animations.{MocapTricker, Model, Animation}

Repo.delete_all(MocapTricker)
{:ok, kerwood} = Animations.create_mocap_tricker(%{first_name: "Alex", last_name: "Kerwood"})
{:ok, frank} = Animations.create_mocap_tricker(%{first_name: "Frank", last_name: "Vasquez (?)"})

Repo.delete_all(Model)
{:ok, kerwood_model} = Animations.create_model(%{name: "Kerwood", filepath: "some/where/idk", mocap_tricker_id: kerwood.id})
{:ok, frank_model} = Animations.create_model(%{name: "Frank", filepath: "other/place/idk", mocap_tricker_id: frank.id})

Repo.delete_all(Animation)
Animations.create_animation(%{name: "Raiz", model_id: frank_model.id, trick_id: raiz.id})
Animations.create_animation(%{name: "Btwist", model_id: kerwood_model.id, trick_id: btwist.id})
