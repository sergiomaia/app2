class EmailsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :create
  http_basic_authentication_with :name => "sergio", :password => "123456"

  def create
    address = params["address"]
    @email = Email.new(:address => address)
    @email.save
    render :nothing => true
  end
end

