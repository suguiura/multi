class Problems::RejectionsController < ApplicationController

  before_filter :find_problem

  # GET /problems/1/rejections
  # GET /problems/1/rejections.xml
  def index
    @rejections = @problem.rejections

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rejections }
      format.xls  { send_file XLS.render_xls(Rejection, @rejections), :filename => 'rejections_listing.xls', :type => "application/vnd.ms-excel" }
    end
  end

  # DELETE /problems/1/rejections/1
  # DELETE /problems/1/rejections/1.xml
  def destroy
    @rejection = Rejection.find(params[:id])
    @rejection.destroy

    respond_to do |format|
      format.html { redirect_to(problem_rejections_url(@problem)) }
      format.xml  { head :ok }
    end
  end
  
  private
    def find_problem
      @problem = Problem.find(params[:problem_id])
    end
end
