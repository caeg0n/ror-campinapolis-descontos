class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ admin ]

  # def after_sign_in_path_for(resource_or_scope) 
  #   binding.pry
  #   #page_index_path 
  # end 
  def admin_options
    option = params.permit(:option)[:option]
    redirect_to controller: 'promos', action: 'new' if option == "new"
    redirect_to controller: 'coupons', action: 'validate' if option == "validate"
  end

  def admin
  end
  
  # def index
  #   # @organizations = Organization.all
  # end

  # def show
  # end

  def new
    @organization = Organization.new
  end

  # def edit
  # end

  def create
    # @organization = Organization.new(organization_params)
    # respond_to do |format|
    #   if @organization.save
    #     format.html { redirect_to organization_url(@organization), notice: "Organization was successfully created." }
    #     format.json { render :show, status: :created, location: @organization }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @organization.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
    # respond_to do |format|
    #   if @organization.update(organization_params)
    #     format.html { redirect_to organization_url(@organization), notice: "Organization was successfully updated." }
    #     format.json { render :show, status: :ok, location: @organization }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @organization.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    # @organization.destroy
    # respond_to do |format|
    #   format.html { redirect_to organizations_url, notice: "Organization was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    def set_organization
      @organization = Organization.find(params[:id])
    end

    def organization_params
      params.require(:organization).permit(:name, :fee, :category_id)
    end
end
