class SessionsController < ApplicationController

  # GET /sessions
  # GET /sessions.xml
  def index
    @sessions = Session.all

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

  # GET /sessions/1/edit
  def edit
    @session = Session.find(params[:id])
  end

  # PUT /sessions/1
  # PUT /sessions/1.xml
  def update
    @session = Session.find(params[:id])

    respond_to do |format|
      if @session.update_attributes(params[:session])
        flash[:notice] = t 'flash.notice.successfully.updated', :object => Session.human_name
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
end
