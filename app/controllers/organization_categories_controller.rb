class OrganizationCategoriesController < ApplicationController
  before_action :set_organization_category, only: %i[ show edit update destroy ]

  # GET /organization_categories or /organization_categories.json
  def index
    @organization_categories = OrganizationCategory.all
  end

  # GET /organization_categories/1 or /organization_categories/1.json
  def show
  end

  # GET /organization_categories/new
  def new
    @organization_category = OrganizationCategory.new
  end

  # GET /organization_categories/1/edit
  def edit
  end

  # POST /organization_categories or /organization_categories.json
  def create
    @organization_category = OrganizationCategory.new(organization_category_params)

    respond_to do |format|
      if @organization_category.save
        format.html { redirect_to organization_category_url(@organization_category), notice: "Organization category was successfully created." }
        format.json { render :show, status: :created, location: @organization_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization_categories/1 or /organization_categories/1.json
  def update
    respond_to do |format|
      if @organization_category.update(organization_category_params)
        format.html { redirect_to organization_category_url(@organization_category), notice: "Organization category was successfully updated." }
        format.json { render :show, status: :ok, location: @organization_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_categories/1 or /organization_categories/1.json
  def destroy
    @organization_category.destroy

    respond_to do |format|
      format.html { redirect_to organization_categories_url, notice: "Organization category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_category
      @organization_category = OrganizationCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_category_params
      params.require(:organization_category).permit(:name)
    end
end
