class Products::SessionsController < ApplicationController

  before_filter :find_product

  # GET /products/1/sessions
  # GET /products/1/sessions.xml
  def index
    @sessions = @product.sessions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sessions }
      format.xls  { send_file XLS.render_xls(@sessions), :filename => 'sessions_listing.xls', :type => "application/vnd.ms-excel" }
    end
  end

  private
    def find_product
      @product = Product.find(params[:product_id])
    end

end
