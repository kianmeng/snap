defmodule Snap.Bulk.Action.Create do
  @moduledoc """
  Represents a create step in a `Snap.Bulk` operation
  """
  @enforce_keys [:doc]
  defstruct [:_index, :_id, :require_alias, :doc]

  @type t :: %__MODULE__{
          _index: String.t() | nil,
          _id: String.t() | nil,
          require_alias: boolean() | nil,
          doc: map()
        }
end

defmodule Snap.Bulk.Action.Delete do
  @moduledoc """
  Represents a delete step in a `Snap.Bulk` operation
  """
  @enforce_keys [:_id]
  defstruct [:_index, :_id, :require_alias]

  @type t :: %__MODULE__{
          _index: String.t() | nil,
          _id: String.t(),
          require_alias: boolean() | nil
        }
end

defmodule Snap.Bulk.Action.Index do
  @moduledoc """
  Represents an index step in a `Snap.Bulk` operation
  """
  @enforce_keys [:doc]
  defstruct [:_index, :_id, :require_alias, :doc]

  @type t :: %__MODULE__{
          _index: String.t() | nil,
          _id: String.t() | nil,
          require_alias: boolean() | nil,
          doc: map()
        }
end

defmodule Snap.Bulk.Action.Update do
  @moduledoc """
  Represents an update step in a `Snap.Bulk` operation
  """
  @enforce_keys [:doc]
  defstruct [:_index, :_id, :require_alias, :doc]

  @type t :: %__MODULE__{
          _index: String.t() | nil,
          _id: String.t() | nil,
          require_alias: boolean() | nil,
          doc: map()
        }
end

defimpl Jason.Encoder, for: Snap.Bulk.Action.Create do
  require Jason.Helpers

  def encode(%Snap.Bulk.Action.Create{_index: index, _id: id, require_alias: require_alias}, opts) do
    values = [_index: index, _id: id, require_alias: require_alias]

    values
    |> Enum.reject(&is_nil(elem(&1, 1)))
    |> then(fn values -> %{"create" => Jason.OrderedObject.new(values)} end)
    |> Jason.Encode.map(opts)
  end
end

defimpl Jason.Encoder, for: Snap.Bulk.Action.Delete do
  require Jason.Helpers

  def encode(%Snap.Bulk.Action.Delete{_index: index, _id: id, require_alias: require_alias}, opts) do
    values = [_index: index, _id: id, require_alias: require_alias]

    values
    |> Enum.reject(&is_nil(elem(&1, 1)))
    |> then(fn values -> %{"delete" => Jason.OrderedObject.new(values)} end)
    |> Jason.Encode.map(opts)
  end
end

defimpl Jason.Encoder, for: Snap.Bulk.Action.Update do
  require Jason.Helpers

  def encode(%Snap.Bulk.Action.Update{_index: index, _id: id, require_alias: require_alias}, opts) do
    values = [_index: index, _id: id, require_alias: require_alias]

    values
    |> Enum.reject(&is_nil(elem(&1, 1)))
    |> then(fn values -> %{"update" => Jason.OrderedObject.new(values)} end)
    |> Jason.Encode.map(opts)
  end
end

defimpl Jason.Encoder, for: Snap.Bulk.Action.Index do
  require Jason.Helpers

  def encode(%Snap.Bulk.Action.Index{_index: index, _id: id, require_alias: require_alias}, opts) do
    values = [_index: index, _id: id, require_alias: require_alias]

    values
    |> Enum.reject(&is_nil(elem(&1, 1)))
    |> then(fn values -> %{"index" => Jason.OrderedObject.new(values)} end)
    |> Jason.Encode.map(opts)
  end
end
