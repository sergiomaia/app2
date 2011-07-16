class EmailsController < ApplicationController
  
  skip_before_filter :verify_authenticity_token, :only => :create
  
  def create
    address = params["address"]
    @email = Email.new(:address => address)
    @email.save
    render :nothing => true
  end
end
