defmodule AdventCode.DayOneTest do
  use ExUnit.Case, async: true
  doctest AdventCode.DayOne

  describe "AdventCode.DayOne.fuel_ammount/1" do
    @expected_fuel [
      {12, 2},
      {14, 2},
      {1969, 654},
      {100_756, 33_583}
    ]

    test "calculate fuel required to launch module" do
      @expected_fuel
      |> Enum.map(fn {mass, fuel} ->
        assert fuel == AdventCode.DayOne.fuel_ammount(mass)
      end)
    end
  end
end
