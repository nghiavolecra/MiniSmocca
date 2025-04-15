class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]

  # GET /properties
  def index
    # Nếu muốn tích hợp chức năng tìm kiếm, ví dụ:
    @properties = Property.all

    if params[:location].present?
      @properties = @properties.by_location(params[:location])
    end

    if params[:min_price].present? && params[:max_price].present?
      @properties = @properties.by_price_range(params[:min_price], params[:max_price])
    end

    if params[:min_area].present?
      @properties = @properties.by_area(params[:min_area])
    end
  end

  # GET /properties/1
  def show
    @property = Property.find(params[:id])
    # Nếu muốn hiển thị các tin liên quan, ví dụ các property khác theo cùng khu vực:
    @related_properties = Property.where(location: @property.location).where.not(id: @property.id).limit(5)
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # POST /properties
  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to @property, notice: "Property was successfully created."
    else
      render :new
    end
  end

  # GET /properties/1/edit
  def edit
  end

  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params)
      redirect_to @property, notice: "Property was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /properties/1
  def destroy
    @property.destroy
    redirect_to properties_url, notice: "Property was successfully destroyed."
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:title, :description, :image_url, :location, :price, :area)
  end
end
