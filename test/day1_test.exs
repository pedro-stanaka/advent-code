defmodule AdventCode.DayOneTest do
  use ExUnit.Case, async: true
  doctest AdventCode.DayOne
  alias AdventCode.DayOne

  describe "AdventCode.DayOne.fuel_ammount/3" do
    @expected_fuel [
      {12, 2},
      {14, 2},
      {90, 28},
      {1969, 654},
      {100_756, 33_583}
    ]

    test "calculate fuel required to launch module" do
      @expected_fuel
      |> Enum.map(fn {mass, fuel} ->
        assert fuel == DayOne.fuel_ammount(mass)
      end)
    end
  end

  describe "AdventCode.DayOne.calculate_total_fuel/1" do
    test "will read file and calculate sum of all required fuel" do
      fixture = './test/fixtures/day1.txt'
      assert 49_147 == DayOne.calculate_total_fuel(fixture)
    end
  end
end
