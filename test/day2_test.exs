defmodule AdventCode.DayTwoTest do
  use ExUnit.Case, async: true
  doctest AdventCode.DayOne

  alias AdventCode.DayTwo

  describe "AdventCode.DayTwo.read_file/1" do
    test "will read file and put numbers into map" do
      fixture = './test/fixtures/day2.txt'
      res = DayTwo.read_file(fixture)

      assert res == [1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50]
    end
  end

  describe "AdventCode.DayTwo.compute_tape/1" do
    test "will compute tape correctly" do
      assert [2, 0, 0, 0, 99] == DayTwo.compute_tape([1, 0, 0, 0, 99])
      assert [2, 3, 0, 6, 99] == DayTwo.compute_tape([2, 3, 0, 3, 99])
      assert [2, 4, 4, 5, 99, 9801] == DayTwo.compute_tape([2, 4, 4, 5, 99, 0])
      assert [30, 1, 1, 4, 2, 5, 6, 0, 99] == DayTwo.compute_tape([1, 1, 1, 4, 99, 5, 6, 0, 99])
    end
  end

  describe "AdventCode.DayTwo.solve/1" do
    test "will read file and compute tape" do
      fixture = './test/fixtures/day2.txt'

      assert "3500,9,10,70,2,3,11,0,99,30,40,50" == DayTwo.solve(fixture)
    end
  end
end
