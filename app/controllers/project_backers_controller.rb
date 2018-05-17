class ProjectBackersController < ApplicationController

  def update
    @project_backer = ProjectBacker.find(params[:id])
    @project_backer.update(project_backer_controller)
  end

  def show
    @project_backer = ProjectBacker.find(params[:id])
    render json: @project_backer
  end

  private 

  def project_backer_controller 
  	params.require(:project_backer).permit(:contract, :times_backed)
  end

end 