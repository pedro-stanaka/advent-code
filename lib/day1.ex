defmodule AdventCode.DayOne do
  @moduledoc """
  Solution for first part of Day 1 challenge
  """

  @doc """
  Calculates the required amount of fuel to launch a
  Saint Nikolaus Spacecraft.

  ## Examples

      iex> AdventCode.DayOne.fuel_ammount(12)
      2
  """
  @spec fuel_ammount(integer) :: integer
  def fuel_ammount(module_mass) do
    floor(module_mass / 3) - 2
  end

  @spec calculate_total_fuel(String.t()) :: integer
  def calculate_total_fuel(filename) do
    filename
    |> File.stream!()
    |> Stream.map(&parse_line/1)
    |> Enum.map(&fuel_ammount/1)
    |> Enum.sum()
  end

  defp parse_line(line) do
    case Integer.parse(line) do
      :error ->
        raise "Error while reading line. Bad value: #{line}"

      {integer, _rest} ->
        integer
    end
  end
end
