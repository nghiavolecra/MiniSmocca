class ContactRequestsController < ApplicationController
  def new
    @contact_request = ContactRequest.new
    # Nếu có tham số property_id, lưu nó để liên kết với property cụ thể
    @contact_request.property_id = params[:property_id] if params[:property_id].present?
  end

  def create
    @contact_request = ContactRequest.new(contact_request_params)
    respond_to do |format|
      if @contact_request.save
        format.html { redirect_to property_path(@contact_request.property), notice: "Thông tin liên hệ của bạn đã được gửi." }
        format.json { render json: { message: "Thông tin liên hệ của bạn đã được gửi.", contact_request: @contact_request }, status: :created }
      else
        format.html { render :new }
        format.json { render json: @contact_request.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def contact_request_params
    params.require(:contact_request).permit(:name, :email, :phone, :appointment_date, :property_id)
  end
end
