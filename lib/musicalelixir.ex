defmodule Musicalelixir do
  def notewheel(note) do
    wheel = [
      :C, 
      {:Csharp, :Dflat}, 
      :D, 
      {:Dsharp, :Eflat}, 
      :E, 
      :F, 
      {:Fsharp, :Gflat}, 
      :G, 
      {:Gsharp, :Aflat},
      :A,
      {:Asharp, :Bflat},
      :B
    ]

    cond do
      is_integer(note) ->
        Enum.at(wheel, note)
      is_atom(note) ->
        note_index(note, wheel, 0)
    end
  end

  defp note_index(note, list, count) do
    unless count > 11 do
      case hd(list) do
        {_, ^note} -> count
        {^note, _} -> count
        ^note      -> count
        _ -> note_index(note, tl(list), count + 1)
      end
    else
    {:error, "Invalid note: #{note}"}
    end
  end
end
