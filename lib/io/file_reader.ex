defmodule AdventCode.Io.FileReader do
  @moduledoc """
  Helper functions to read files
  """

  @doc """
  Reads a file where each line contains a integer number representation and
  apply callback over each line in the file, then reduces it summing the result
  up.
  """
  @spec iterate_file_and_sum(String.t(), (integer() -> number())) :: number()
  def iterate_file_and_sum(filename, callback) do
    filename
    |> File.stream!()
    |> Stream.map(&parse_line/1)
    |> Stream.map(fn x -> callback.(x) end)
    |> Enum.sum()
  end

  @doc """
  Reads a integer from a line, removing any special char at the end (e.g.
  carriage returns).
  """
  defp parse_line(line) do
    case Integer.parse(line) do
      :error ->
        raise "Error while reading line. Bad value: #{line}"

      {integer, _rest} ->
        integer
    end
  end
end
