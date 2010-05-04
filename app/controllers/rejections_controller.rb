class RejectionsController < ApplicationController

  # GET /rejections
  # GET /rejections.xml
  def index
    @rejections = Rejection.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rejections }
      format.xls  { send_file XLS.render_xls(Rejection, @rejections), :filename => 'rejections_listing.xls', :type => "application/vnd.ms-excel" }
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
