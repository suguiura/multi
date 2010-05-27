class Operators::SessionsController < ApplicationController

  before_filter :find_operator

  # GET /operators/1/sessions
  # GET /operators/1/sessions.xml
  def index
    @sessions = @operator.sessions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sessions }
      format.xls  { send_file XLS.render_xls(@sessions), :filename => 'sessions_listing.xls', :type => "application/vnd.ms-excel" }
    end
  end

  private
    def find_operator
      @operator = Operator.find(params[:operator_id])
    end

end
