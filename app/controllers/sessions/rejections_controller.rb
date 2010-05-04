class Sessions::RejectionsController < ApplicationController

  before_filter :find_session

  # GET /sessions/1/rejections
  # GET /sessions/1/rejections.xml
  def index
    @rejections = @session.rejections

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rejections }
      format.xls  { send_file XLS.render_xls(Rejection, @rejections), :filename => 'rejections_listing.xls', :type => "application/vnd.ms-excel" }
    end
  end

  # GET /sessions/1/rejections/new
  # GET /sessions/1/rejections/new.xml
  def new
    @rejection = Rejection.new
    @rejection.session = @session

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rejection }
    end
  end

  # POST /sessions/1/rejections
  # POST /sessions/1/rejections.xml
  def create
    @rejection = Rejection.new(params[:rejection])

    respond_to do |format|
      if @rejection.save
        flash[:notice] = 'Rejection was successfully created.'
        format.html { redirect_to(session_rejections_url(@rejection.session)) }
        format.xml  { render :xml => @rejection, :status => :created, :location => @rejection }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rejection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1/rejections/1
  # DELETE /sessions/1/rejections/1.xml
  def destroy
    @rejection = Rejection.find(params[:id])
    @rejection.destroy

    respond_to do |format|
      format.html { redirect_to(session_rejections_url(@session)) }
      format.xml  { head :ok }
    end
  end

  private
    def find_session
      @session = Session.find(params[:session_id])
    end
end
