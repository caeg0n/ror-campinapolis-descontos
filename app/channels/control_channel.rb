class ControlChannel < ApplicationCable::Channel
  def subscribed
    dados = []
    stream_from "control_channel"
    ActionCable.server.broadcast 'control_channel',dados
  end

  def receive(data)
    binding.pry
    # ActionCable.server.broadcast("chat_#{params[:room]}", data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
