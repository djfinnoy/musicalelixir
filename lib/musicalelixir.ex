defmodule Musicalelixir do
  @spec notewheel() :: list(binary)
  def notewheel() do
    ["C", "", "D", "", "E", "F", "", "G", "", "A", "", "B"]
  end

  @spec notewheel(binary) :: integer
  def notewheel(note) when is_binary(note) do
    natural_index = get_index(String.at(note, 0), notewheel())
    accidentals = String.slice(note, 1..-1)
    accidental_adjustment = cond do
      String.length(accidentals) == 0 -> 0
      String.match?(accidentals, ~r/^\#{0,}$/) -> String.length(accidentals)
      String.match?(accidentals, ~r/^b{0,}$/) -> String.length(accidentals) * -1
      true -> {:error, "Invalid note: #{note}"}
    end
    rem(natural_index + accidental_adjustment + 12, 12)
  end

  @spec majorscale(binary) :: list(binary)
  def majorscale(root) do
    intervals = [2, 2, 1, 2, 2, 2, 1]
    build_scale(intervals, [root])
  end

  @spec build_scale(list(integer), list(binary)) :: list(binary)
  defp build_scale(intervals, result) do
    if intervals == [] do result else
      naturals = ["C", "D", "E", "F", "G", "A", "B"]
      prev_note = List.last(result)
      prev_natural = String.at(prev_note, 0)
      next_natural = Enum.at(naturals, rem(get_index(prev_natural, naturals) + 1, 7))
      prev_wheelpos = notewheel(prev_note)
      next_wheelpos = rem(prev_wheelpos + hd(intervals), 12)
      adjustment = rem(next_wheelpos - notewheel(next_natural), 12)
      accidentals = cond do
        adjustment == 0 -> ""
        adjustment > 6 -> String.duplicate("b", 12 - adjustment)
        adjustment < -6 -> String.duplicate("#", 12 + adjustment)
        adjustment > 0 -> String.duplicate("#", adjustment)
        adjustment < 0 -> String.duplicate("b", adjustment * -1)
      end
      build_scale(tl(intervals), result ++ [next_natural <> accidentals])
    end
  end

  @spec get_index(any, list) :: integer
  defp get_index(x, xs) do
    Enum.with_index(xs)
    |> List.keyfind!(x, 0)
    |> elem(1)
  end
end
