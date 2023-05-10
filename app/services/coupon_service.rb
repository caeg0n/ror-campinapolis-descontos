#require 'stripe'
class CouponService
   #include HTTParty
  
  def initialize(params)
    #@source = params[:source]
  end

  def check_client_coupon(data)
    return true
  end

private
  # attr_reader :card, :amount, :email
  def external_charge_service
    return
  end

end