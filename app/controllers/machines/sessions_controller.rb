class Machines::SessionsController < ApplicationController

  before_filter :find_machine

  # GET /machine/1/sessions
  # GET /machine/1/sessions.xml
  def index
    @sessions = @machine.sessions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sessions }
      format.xls  { send_file XLS.render_xls(Session, @sessions), :filename => 'sessions_listing.xls', :type => "application/vnd.ms-excel" }
    end
  end

  # GET /machine/1/sessions/new
  # GET /machine/1/sessions/new.xml
  def new
    @session = Session.new
    @session.machine = @machine

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @session }
    end
  end

  # POST /machine/1/sessions
  # POST /machine/1/sessions.xml
  def create
    @session = Session.new(params[:session])

    respond_to do |format|
      if @session.save
        flash[:notice] = 'Session was successfully created.'
        format.html { redirect_to(@session) }
        format.xml  { render :xml => @session, :status => :created, :location => @session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @session.errors, :status => :unprocessable_entity }
      end
    end
  end

  private
    def find_machine
      @machine = Machine.find(params[:machine_id])
    end

end
