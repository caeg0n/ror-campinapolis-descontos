class CableService
  include JwtHelper
  
  def initialize(session)
    @session = session.clone
  end

  def send_message(msg_type)
    session_controller_login() if msg_type == "login"
    coupons_controller_validate() if msg_type == "validate" 
  end

  def process_message(token)
    resp = decode_jwt_token(token["token"])
    checkcupon(resp) if resp[0]["command"] == "checkcupon"
  end

private
  
  def fix_session()
    secret = Rails.application.credentials.jwt_secret
    s = {}.merge(@session)
    s.delete("command")
    s.delete("session_id")
    s.delete("user_return_to")
    s.delete("warden.user.user.key")
    token = generate_jwt_token(s.to_h)
    return token
  end

  def session_controller_login()
    message = {"command":"login","device_id":@session[:device_id],"data":fix_session}
    ActionCable.server.broadcast 'control_channel',message
  end

  def coupons_controller_validate()
    message = {"command":"validate","device_id":@session[:device_id],"data":fix_session}
    ActionCable.server.broadcast 'control_channel',message
  end

  def checkcupon(decoded_token)
    data = decoded_token[0]["data"]
    puts data 
  end

end