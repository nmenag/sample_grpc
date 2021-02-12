defmodule SampleGrpc.Endpoint do
  use GRPC.Endpoint

  intercept GRPC.Logger.Server
  run SampleGrpc.User.Server
end

defmodule SampleGrpc.User.Server do
  use GRPC.Server, service: SampleGrpc.User.Service

  def create(request, _stream) do
    new_user =
      UserDB.add_user(%{
        first_name: request.first_name,
        last_name: request.last_name,
        age: request.age
      })

    SampleGrpc.UserReply.new(new_user)
  end

  def get(request, _stream) do
    user = UserDB.get_user(request.id)

    if user == nil do
      raise GRPC.RPCError, status: :not_found
    else
      SampleGrpc.UserReply.new(user)
    end
  end
end
