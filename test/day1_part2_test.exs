defmodule AdventCode.DayOnePartTwoTest do
  use ExUnit.Case, async: true
  doctest AdventCode.DayOnePartTwo
  alias AdventCode.DayOnePartTwo

  describe "AdventCode.DayOnePartTwo.calculate_fuel_complete/1" do
    @expected_fuel [
      {12, 2},
      {14, 2},
      {90, 35},
      {1969, 966},
      {100_756, 50_346}
    ]

    test "calculate fuel required to launch module and of fuel" do
      @expected_fuel
      |> Enum.map(fn {mass, fuel} ->
        assert fuel == DayOnePartTwo.calculate_fuel_complete(mass)
      end)
    end
  end

  describe "AdventCode.DayOnePartTwo.calculate_total_from_file/1" do
    test "will read file and calculate sum of all required fuel" do
      fixture = './test/fixtures/day1.txt'
      assert 73_652 == DayOnePartTwo.calculate_total_from_file(fixture)
    end
  end
end
