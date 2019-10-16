class CustomFieldsController < ApplicationController
  before_action :zap_basic_auth, except: :index

  # GET /custom_fields
  # GET /custom_fields.json
  def index
    @custom_fields = CustomField.all
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_custom_field
    @custom_field = CustomField.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def custom_field_params
    params.fetch(:custom_field, {})
  end
end
