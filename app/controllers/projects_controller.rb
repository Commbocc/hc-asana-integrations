class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update]
  before_action :zap_basic_auth
  protect_from_forgery except: :update

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.add_department_cfs
        # format.html { render :show }
        format.json { render :show }
      else
        # format.html { render :edit }
        format.json { render json: false }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.new(gid: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.fetch(:project, {})
    # params.require(:proj_id)
  end
end
