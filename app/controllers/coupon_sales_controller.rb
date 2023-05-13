class CouponSalesController < ApplicationController
  before_action :set_coupon_sale, only: %i[ show edit update destroy ]

  # GET /coupon_sales or /coupon_sales.json
  def index
    @coupon_sales = CouponSale.all
  end

  # GET /coupon_sales/1 or /coupon_sales/1.json
  def show
  end

  # GET /coupon_sales/new
  def new
    @coupon_sale = CouponSale.new
  end

  # GET /coupon_sales/1/edit
  def edit
  end

  # POST /coupon_sales or /coupon_sales.json
  def create
    @coupon_sale = CouponSale.new(coupon_sale_params)

    respond_to do |format|
      if @coupon_sale.save
        format.html { redirect_to coupon_sale_url(@coupon_sale), notice: "Coupon sale was successfully created." }
        format.json { render :show, status: :created, location: @coupon_sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coupon_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupon_sales/1 or /coupon_sales/1.json
  def update
    respond_to do |format|
      if @coupon_sale.update(coupon_sale_params)
        format.html { redirect_to coupon_sale_url(@coupon_sale), notice: "Coupon sale was successfully updated." }
        format.json { render :show, status: :ok, location: @coupon_sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coupon_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupon_sales/1 or /coupon_sales/1.json
  def destroy
    @coupon_sale.destroy

    respond_to do |format|
      format.html { redirect_to coupon_sales_url, notice: "Coupon sale was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon_sale
      @coupon_sale = CouponSale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coupon_sale_params
      params.require(:coupon_sale).permit(:promo_id, :coupon_type, :status)
    end
end
