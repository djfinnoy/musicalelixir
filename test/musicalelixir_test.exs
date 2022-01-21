defmodule MusicalelixirTest do
  use ExUnit.Case
  doctest Musicalelixir
  import Musicalelixir

  test "majorscales" do
    assert majorscale("Cb") == ["Cb", "Db", "Eb", "Fb", "Gb", "Ab", "Bb", "Cb"]
    assert majorscale("C")  == ["C", "D", "E", "F", "G", "A", "B", "C"]
    assert majorscale("C#") == ["C#", "D#", "E#", "F#", "G#", "A#", "B#", "C#"]
    assert majorscale("Db") == ["Db", "Eb", "F", "Gb", "Ab", "Bb", "C", "Db"]
    assert majorscale("D")  == ["D", "E", "F#", "G", "A", "B", "C#", "D"]
    assert majorscale("D#") == ["D#", "E#", "F##", "G#", "A#", "B#", "C##", "D#"]
    assert majorscale("Eb") == ["Eb", "F", "G", "Ab", "Bb", "C", "D", "Eb"]
    assert majorscale("E")  == ["E", "F#", "G#", "A", "B", "C#", "D#", "E"]
    assert majorscale("E#") == ["E#", "F##", "G##", "A#", "B#", "C##", "D##", "E#"]
    assert majorscale("Fb") == ["Fb", "Gb", "Ab", "Bbb", "Cb", "Db", "Eb", "Fb"]
    assert majorscale("F")  == ["F", "G", "A", "Bb", "C", "D", "E", "F"]
    assert majorscale("F#") == ["F#", "G#", "A#", "B", "C#", "D#", "E#", "F#"]
    assert majorscale("Gb") == ["Gb", "Ab", "Bb", "Cb", "Db", "Eb", "F", "Gb"]
    assert majorscale("G")  == ["G", "A", "B", "C", "D", "E", "F#", "G"]
    assert majorscale("G#") == ["G#", "A#", "B#", "C#", "D#", "E#", "F##", "G#"]
    assert majorscale("Ab") == ["Ab", "Bb", "C", "Db", "Eb", "F", "G", "Ab"]
    assert majorscale("A")  == ["A", "B", "C#", "D", "E", "F#", "G#", "A"]
    assert majorscale("A#") == ["A#", "B#", "C##", "D#", "E#", "F##", "G##", "A#"]
    assert majorscale("Bb") == ["Bb", "C", "D", "Eb", "F", "G", "A", "Bb"]
    assert majorscale("B")  == ["B", "C#", "D#", "E", "F#", "G#", "A#", "B"]
    assert majorscale("B#") == ["B#", "C##", "D##", "E#", "F##", "G##", "A##", "B#"]
  end
end
