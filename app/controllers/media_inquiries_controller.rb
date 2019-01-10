class MediaInquiriesController < ApplicationController
  http_basic_authenticate_with name: ENV["ASANA_MI_AUTH_NAME"], password: ENV["ASANA_MI_AUTH_PASS"]
  before_action :set_media_inquiry, only: [:show]
  protect_from_forgery except: :create

  def index
    redirect_to 'https://app.asana.com/0/823353078566958/list'
  end

  # GET /media_inquiries/1
  # GET /media_inquiries/1.json
  def show
  end

  # POST /media_inquiries
  # POST /media_inquiries.json
  def create
    @media_inquiry = MediaInquiry.new(media_inquiry_params)
    @media_inquiry.send_email
    @media_inquiry.clear_custom_field_trigger

    respond_to do |format|
      format.html { render :show, layout: false }
      format.json { render :show, formats: :json }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_media_inquiry
    @media_inquiry = MediaInquiry.new(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def media_inquiry_params
    # params.fetch(:media_inquiry, {})
    params.require(:task_id)
  end
end
