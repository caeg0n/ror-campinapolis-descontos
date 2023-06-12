class CouponProductsController < ApplicationController
  before_action :set_coupon_product, only: %i[ show edit update destroy ]

  # GET /coupon_products or /coupon_products.json
  def index
    @coupon_products = CouponProduct.all
  end

  # GET /coupon_products/1 or /coupon_products/1.json
  def show
  end

  # GET /coupon_products/new
  def new
    @coupon_product = CouponProduct.new
  end

  # GET /coupon_products/1/edit
  def edit
  end

  # POST /coupon_products or /coupon_products.json
  def create
    @coupon_product = CouponProduct.new(coupon_product_params)

    respond_to do |format|
      if @coupon_product.save
        format.html { redirect_to coupon_product_url(@coupon_product), notice: "Coupon product was successfully created." }
        format.json { render :show, status: :created, location: @coupon_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coupon_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupon_products/1 or /coupon_products/1.json
  def update
    respond_to do |format|
      if @coupon_product.update(coupon_product_params)
        format.html { redirect_to coupon_product_url(@coupon_product), notice: "Coupon product was successfully updated." }
        format.json { render :show, status: :ok, location: @coupon_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coupon_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupon_products/1 or /coupon_products/1.json
  def destroy
    @coupon_product.destroy
    respond_to do |format|
      format.html { redirect_to coupon_products_url, notice: "Coupon product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon_product
      @coupon_product = CouponProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coupon_product_params
      params.require(:coupon_product).permit(:promo_id, :product_id, :coupon_type, :status)
    end
end
