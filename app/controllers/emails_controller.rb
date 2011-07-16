class EmailsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :create

  def index
    @emails = Email.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @emails }
    end

  end


  def create
    address = params["address"]
    @email = Email.new(:address => address)
    @email.save
    render :nothing => true
  end
end

