class CouponsController < ApplicationController
  before_action :set_coupon, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new ]

  # def index
  #   @coupons = Coupon.all
  # end
  # def admin_options
   
  #   # option = params.permit(:option)[:option]
  #   # if option == "new"
  #   #   redirect_to controller: 'coupon', action: 'new'
  #   # end
  # end

  # def show
  #   binding.pry
  # end

  def check_success
  end

  def check_fail
  end

  def validate
    if (session[:user_id] > 0 and current_user.id == session[:user_id])
      session["user_id"] = current_user.id
      cable_manager = CableService.new(session)
      cable_manager.send_message("validate")
    else
      redirect_to root_path
    end
  end

  def new
    # @coupon = Coupon.new
  end

  # def edit
  # end

  def create
    # @coupon = Coupon.new(coupon_params)
    respond_to do |format|
      if @coupon.save
        format.html { redirect_to coupon_url(@coupon), notice: "Coupon was successfully created." }
        format.json { render :show, status: :created, location: @coupon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   respond_to do |format|
  #     if @coupon.update(coupon_params)
  #       format.html { redirect_to coupon_url(@coupon), notice: "Coupon was successfully updated." }
  #       format.json { render :show, status: :ok, location: @coupon }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @coupon.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @coupon.destroy
  #   respond_to do |format|
  #     format.html { redirect_to coupons_url, notice: "Coupon was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    def coupon_params
      params.require(:coupon).permit(:qrcode,:product_id, :coupon_type, :value, :expiration, :status)
    end
end
