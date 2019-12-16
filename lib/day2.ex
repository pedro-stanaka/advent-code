defmodule AdventCode.DayTwo do
  @moduledoc """
  Solution for day 2 of challenges
  """

  @sum_op 1
  @mult_op 2
  @halt_op 99

  @doc """
  Reads a file with one line separated by commas,
  and turns the file into an array.
  """
  def read_file(filename) do
    File.read!(filename)
    |> String.split(",")
    |> Enum.map(&AdventCode.Io.FileReader.parse_int/1)
  end

  def solve(filename) do
    filename
    |> read_file()
    |> compute_tape()
    |> Enum.join(",")
  end

  @doc """
  Compute the logical tape with op codes 1, 2 and 99

  ## Examples

    iex> AdventCode.DayTwo.compute_tape([1,0,0,0,99])
    [2,0,0,0,99]
  """
  def compute_tape(tape) do
    compute(tape, 0)
  end

  defp compute(tape, cur_pos) do
    fragment = Enum.slice(tape, cur_pos, 4)

    cond do
      Enum.at(fragment, cur_pos) == @halt_op ->
        tape

      length(fragment) < 4 ->
        tape

      true ->
        tape = handle_op(tape, fragment)
        compute(tape, cur_pos + 4)
    end
  end

  defp handle_op(tape, [op_code, op1_idx, op2_idx, res_idx]) do
    case op_code do
      @sum_op ->
        sum = Enum.at(tape, op1_idx) + Enum.at(tape, op2_idx)
        List.replace_at(tape, res_idx, sum)

      @mult_op ->
        mult = Enum.at(tape, op1_idx) * Enum.at(tape, op2_idx)
        List.replace_at(tape, res_idx, mult)

      @halt_op ->
        tape
    end
  end
end
