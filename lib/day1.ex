defmodule AdventCode.DayOne do
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

  defp read_file(filename) do
    File.stream!(filename)
  end
end
