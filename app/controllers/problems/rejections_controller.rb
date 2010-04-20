class Problems::RejectionsController < ApplicationController

  before_filter :find_problem

  # GET /problems/1/rejections
  # GET /problems/1/rejections.xml
  def index
    @rejections = @problem.rejections

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rejections }
    end
  end
  
  private
    def find_problem
      @problem = Problem.find(params[:problem_id])
    end
end
