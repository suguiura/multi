class RejectionsController < ApplicationController

  before_filter :find_session, :only => [ :index, :new, :create ]

  # GET /rejections
  # GET /rejections.xml
  # GET /sessions/1/rejections
  # GET /sessions/1/rejections.xml
  def index
    @rejections = if @session
      @session.rejections
    else
      Rejection.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rejections }
    end
  end

  # GET /rejections/1
  # GET /rejections/1.xml
  def show
    @rejection = Rejection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rejection }
    end
  end

  # GET /sessions/1/rejections/new
  # GET /sessions/1/rejections/new.xml
  def new
    @rejection = @session.rejections.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rejection }
    end
  end

  # GET /rejections/1/edit
  def edit
    @rejection = Rejection.find(params[:id])
  end

  # POST /sessions/1/rejections
  # POST /sessions/1/rejections.xml
  def create
    @rejection = @session.rejections.build(params[:rejection])

    respond_to do |format|
      if @rejection.save
        flash[:notice] = 'Rejection was successfully created.'
        format.html { redirect_to(@rejection) }
        format.xml  { render :xml => @rejection, :status => :created, :location => @rejection }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rejection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rejections/1
  # PUT /rejections/1.xml
  def update
    @rejection = Rejection.find(params[:id])

    respond_to do |format|
      if @rejection.update_attributes(params[:rejection])
        flash[:notice] = 'Rejection was successfully updated.'
        format.html { redirect_to(@rejection) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rejection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rejections/1
  # DELETE /rejections/1.xml
  def destroy
    @rejection = Rejection.find(params[:id])
    @session = @rejection.session
    @rejection.destroy

    respond_to do |format|
      format.html { redirect_to(session_rejections_url(@session)) }
      format.xml  { head :ok }
    end
  end
  
  private
    def find_session
      @session = Session.find(params[:session_id]) if params[:session_id]
    end
end
