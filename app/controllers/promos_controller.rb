class PromosController < ApplicationController
  before_action :set_promo, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new ]

  def new
    
  end

  def success
    flash[:promos_create_coupon_product_ok] = "Produto Criado com Sucesso!"
  end

  def create
    promo = Promo.new
    p = promo_params
    coupon_type = p[:coupon_type] if p[:coupon_type].present?
    coupon_quantity = p[:coupon_quantity].to_i if p[:coupon_quantity].present?
    coupon_price = p[:coupon_price].to_f if p[:coupon_price].present?
    coupon_expiration = p[:coupon_expiration].to_i if p[:coupon_expiration].present?
    is_test_mode = p[:is_test_mode] if p[:is_test_mode].present?
    product_selected = p[:product_selected].to_i if p[:product_selected].present?
    respond_to do |format|
      if not [nil,"checked"].include?(is_test_mode)
        format.html { render :new, status: :unprocessable_entity }
        flash[:promos_create_promo_mode_error] = "Modo da Campanha Inválido!"
      end
      if not ["type_sale","type_product"].include?(coupon_type)
        format.html { render :new, status: :unprocessable_entity }
        flash[:promos_create_coupon_type_error] = "Tipo de Cupom Inválido!"
      end
      if (coupon_quantity.nil? || coupon_quantity < 1 || coupon_quantity > 99)
        format.html { render :new, status: :unprocessable_entity }
        flash[:promos_create_coupon_quantity_error] = "Número de Cupons Inválido!"
      end
      if (coupon_expiration.nil? || coupon_expiration < 1 || coupon_expiration > 354)
        format.html { render :new, status: :unprocessable_entity }
        flash[:promos_create_coupon_expiration_error] = "Data de Validade dos Cupons Inválida!"
      end
      if (coupon_price.nil? || coupon_price < 1 || coupon_price > 99)
        format.html { render :new, status: :unprocessable_entity }
        flash[:promos_create_price_error] = "Valor do Cupom Inválido!"
      end
      if ["type_product"].include?(coupon_type)
        products = Product.where(organization_id: current_user.id)
        if (product_selected < 1)
          format.html { render :new, status: :unprocessable_entity }
          flash[:promos_create_coupon_product_selected_error] = "Produto Inválido!"
        end
      end
      #set promo params
      promo.organization_id = Organization.where(user_id:current_user.id)[0].id
      promo.coupon_price = coupon_price
      promo.expiration = DateTime.now + coupon_expiration.days
      promo.status = Promo.statuses[:enabled] if is_test_mode == nil
      promo.status = Promo.statuses[:test_mode] if is_test_mode == "checked"
      promo.save
      #set coupon param
      coupon = CouponProduct.new if coupon_type == "type_product"
      coupon = CouponSale.new if coupon_type == "type_sale"
      
      coupon.promo_id = Promo.last.id
      coupon.product_id = product_selected if coupon_type == "type_product"
      coupon.coupon_type = CouponProduct.coupon_types["default"] if coupon_type == "type_product"  
      coupon.status = CouponProduct.statuses["enabled"] if coupon_type == "type_product"
      
      coupon.coupon_type = CouponSale.coupon_types["default"] if coupon_type == "type_sale"
      coupon.status = CouponSale.statuses["enabled"] if coupon_type == "type_sale"
      coupon.save
      
      format.html { redirect_to action: :success }
    end
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
      params.require(:promo).permit(:product_selected,:coupon_type,:coupon_quantity,:coupon_price,:coupon_expiration,:is_test_mode,:organization_id, :coupon_price)
    end
end
