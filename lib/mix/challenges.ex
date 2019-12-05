defmodule Mix.Tasks.Challenges do
  use Mix.Task

  @challenge_module_mapping %{
    day1: &AdventCode.DayOne.calculate_total_fuel/1
  }

  @impl Mix.Task
  @shortdoc """
  Run the solutions for the challenges of Advent Of Code
  """
  @moduledoc ~S"""
  Command to run the solutions for the challenges of Advent Of Code.

  To run a single command execute on shell:
  ```
    mix challenges day1 /path/input/file.txt
  ```

  To get a list of available challenges, run the command without arguments:
  ```
    mix challenges
  ```
  """
  def run([challenge_name, filename | _]) do
    challenge = String.to_atom(challenge_name)

    unless Map.has_key?(@challenge_module_mapping, challenge) do
      Mix.shell().error("The challenge #{challenge_name} was not registered or not implemented.")
      print_challenge_names()
      System.halt(1)
    end

    unless File.exists?([filename]) do
      Mix.shell().error("The file #{filename} does not exist.")
      System.halt(1)
    end

    result = @challenge_module_mapping[challenge].(filename)
    Mix.shell().info("Final result: #{result}")
  end

  def run(_) do
    Mix.shell().info("Usage: mix challenges <challenge> <input_file>.")
    print_challenge_names()
  end

  defp print_challenge_names() do
    Mix.shell().info("\nList of available challenges:")

    @challenge_module_mapping
    |> Enum.each(fn {name, _} -> Mix.shell().info(" * #{name}") end)
  end
end
