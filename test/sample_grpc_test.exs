defmodule SampleGrpcTest do
  use ExUnit.Case
  doctest SampleGrpc

  test "greets the world" do
    assert SampleGrpc.hello() == :world
  end
end
