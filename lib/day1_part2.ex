defmodule AdventCode.DayOnePartTwo do
  @moduledoc """
  Solution for second part of Day 1 challenge
  """

  alias AdventCode.DayOne
  alias AdventCode.Io.FileReader

  def calculate_fuel_complete(module_mass) when module_mass <= 0, do: 0

  @doc """
  Calculates the required fuel to launch a module with mass module_mass,
  moreover it also sums the ammount of fuel required to launch the fuel
  mass as well.

  Example: To launch a module of mass 36 it is required 10 units of fuel,
  but to launch 10 units of fuel we still need 1 unit of fuel.
  Therefore, we need in total 11 units of fuel to launch the 36 mass module.

  ## Examples

    iex> AdventCode.DayOnePartTwo.calculate_fuel_complete(36)
    11
  """
  @spec calculate_fuel_complete(integer) :: integer
  def calculate_fuel_complete(module_mass) do
    module_fuel = DayOne.fuel_ammount(module_mass)
    module_fuel + calculate_fuel_complete(module_fuel)
  end

  def calculate_total_from_file(filename) do
    FileReader.iterate_file_and_sum(filename, &calculate_fuel_complete/1)
  end
end
