class MachinesController < ApplicationController
  # GET /machines
  # GET /machines.xml
  def index
    @machines = Machine.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @machines }
      format.xls  { send_file XLS.render_xls(@machines), :filename => 'machines_listing.xls', :type => "application/vnd.ms-excel" }
    end
  end

  # GET /machines/1
  # GET /machines/1.xml
  def show
    @machine = Machine.find(params[:id])
    @clone_machine = @machine.clone
    
    #s = params[:start]
    #e = params[:end]
    #conditions = (s && e) ? {:start => s..e} : {}
    #@clone_machine.sessions = @machine.sessions.find :all, :conditions => conditions

    d = params[:date]
    conditions = d ? {:start => d} : {}
    @clone_machine.sessions = @machine.sessions.find :all, :conditions => conditions

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @machine }
    end
  end

  # GET /machines/new
  # GET /machines/new.xml
  def new
    @machine = Machine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @machine }
    end
  end

  # GET /machines/1/edit
  def edit
    @machine = Machine.find(params[:id])
  end

  # POST /machines
  # POST /machines.xml
  def create
    @machine = Machine.new(params[:machine])

    respond_to do |format|
      if @machine.save
        flash[:notice] = t 'flash.notice.successfully.created', :object => Machine.human_name
        format.html { redirect_to(@machine) }
        format.xml  { render :xml => @machine, :status => :created, :location => @machine }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @machine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /machines/1
  # PUT /machines/1.xml
  def update
    @machine = Machine.find(params[:id])

    respond_to do |format|
      if @machine.update_attributes(params[:machine])
        flash[:notice] = t 'flash.notice.successfully.updated', :object => Machine.human_name
        format.html { redirect_to(@machine) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @machine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /machines/1
  # DELETE /machines/1.xml
  def destroy
    @machine = Machine.find(params[:id])
    @machine.destroy

    respond_to do |format|
      format.html { redirect_to(machines_url) }
      format.xml  { head :ok }
    end
  end
end
