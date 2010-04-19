class RejectionsController < ApplicationController
  # GET /rejections
  # GET /rejections.xml
  def index
    @rejections = Rejection.all

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

  # GET /rejections/new
  # GET /rejections/new.xml
  def new
    @rejection = Rejection.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rejection }
    end
  end

  # GET /rejections/1/edit
  def edit
    @rejection = Rejection.find(params[:id])
  end

  # POST /rejections
  # POST /rejections.xml
  def create
    @rejection = Rejection.new(params[:rejection])

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
    @rejection.destroy

    respond_to do |format|
      format.html { redirect_to(rejections_url) }
      format.xml  { head :ok }
    end
  end
end
