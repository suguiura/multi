class SessionsController < ApplicationController

  before_filter :find_machine, :only => [ :index, :new, :create ]

  # GET /sessions
  # GET /sessions.xml
  # GET /machine/1/sessions
  # GET /machine/1/sessions.xml
  def index
    @sessions = if @machine
      @machine.sessions
    else
      Session.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sessions }
      format.xls  { send_file XLS.render_xls(@sessions), :filename => 'sessions_listing.xls', :type => "application/vnd.ms-excel" }
    end
  end

  # GET /sessions/1
  # GET /sessions/1.xml
  def show
    @session = Session.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @session }
    end
  end

  # GET /machine/1/sessions/new
  # GET /machine/1/sessions/new.xml
  def new
    @session = @machine.sessions.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @session }
    end
  end

  # GET /sessions/1/edit
  def edit
    @session = Session.find(params[:id])
  end

  # POST /machine/1/sessions
  # POST /machine/1/sessions.xml
  def create
    @session = @machine.sessions.build(params[:session])

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

  # PUT /sessions/1
  # PUT /sessions/1.xml
  def update
    @session = Session.find(params[:id])

    respond_to do |format|
      if @session.update_attributes(params[:session])
        flash[:notice] = 'Session was successfully updated.'
        format.html { redirect_to(@session) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.xml
  def destroy
    @session = Session.find(params[:id])
    @machine = @session.machine
    @session.destroy

    respond_to do |format|
      format.html { redirect_to(machine_sessions_url(@machine)) }
      format.xml  { head :ok }
    end
  end
  
  private
    def find_machine
      @machine = Machine.find(params[:machine_id]) if params[:machine_id]
    end
end
