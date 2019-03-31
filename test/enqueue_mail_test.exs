defmodule EnqueueMailTest do
  use ExUnit.Case
  doctest EnqueueMail

  test "greets the world" do
    assert EnqueueMail.hello() == :world
  end
end
