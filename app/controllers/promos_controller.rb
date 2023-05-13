class PromosController < ApplicationController
  before_action :set_promo, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new ]

  def new
    # @promo = Promo.new
  end
  
  def create
    # @promo = Promo.new(promo_params)
    # respond_to do |format|
    #   if @promo.save
    #     format.html { redirect_to promo_url(@promo), notice: "Promo was successfully created." }
    #     format.json { render :show, status: :created, location: @promo }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @promo.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    # @promo.destroy
    # respond_to do |format|
    #   format.html { redirect_to promos_url, notice: "Promo was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # def set_promo
    #   @promo = Promo.find(params[:id])
    # end

    def promo_params
      params.require(:promo).permit(:organization_id, :coupon_price, :expiration, :status)
    end
end
