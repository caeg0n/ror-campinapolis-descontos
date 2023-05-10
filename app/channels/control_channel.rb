class ControlChannel < ApplicationCable::Channel
  def subscribed
    dados = []
    stream_from "control_channel"
    ActionCable.server.broadcast 'control_channel',dados
  end

  def receive(data)
    resp_success = {}
    resp_fail = {}
    coupon_manager = CouponService.new({}) 
    device = data["message"]["device"]
    coupon_info = data["message"]["data"]
    resp_success["device_id"] = device
    resp_fail["device_id"] = device
    resp_success["command"] = "redirect_with_coupon_check_success"
    resp_fail["command"] = "redirect_with_coupon_check_fail"
    if coupon_manager.check_client_coupon(coupon_info) == true then
      ActionCable.server.broadcast('control_channel',resp_success)
      else
      ActionCable.server.broadcast('control_channel',resp_fail)
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
