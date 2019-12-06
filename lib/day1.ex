defmodule AdventCode.DayOne do
  @moduledoc """
  Solution for first part of Day 1 challenge
  """
  alias AdventCode.Io.FileReader

  @doc """
  Calculates the required amount of fuel to launch a
  Saint Nikolaus Spacecraft.

  ## Examples

      iex> AdventCode.DayOne.fuel_ammount(12)
      2
  """
  @spec fuel_ammount(integer) :: integer
  def fuel_ammount(module_mass) do
    case floor(module_mass / 3) - 2 do
      x when x > 0 -> x
      _ -> 0
    end
  end

  @spec calculate_total_fuel(String.t()) :: integer
  def calculate_total_fuel(filename) do
    FileReader.iterate_file_and_sum(filename, &fuel_ammount/1)
  end
end
