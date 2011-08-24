class PayeesController < ApplicationController
  
  before_filter :login_required
  
  def index
    @payees = Payee.all
  end
  
  def new
    @payee = Payee.new
  end
  
  def create
    @payee = Payee.new(params[:payee])
    if @payee.save
      redirect_to(payees_url, :notice => "Payee was successfully added.")
    else
      render :action => 'new', :status => :unprocessable_entity
    end
  end
  
  def edit
    @payee = Payee.find_by_id(params[:id])
  end
  
  def update
    @payee = Payee.find_by_id(params[:id])
    if @payee.update_attributes(params[:payee])
      redirect_to(payees_url, :notice => "Payee was successfully updated.")
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @payee = Payee.find_by_id(params[:id])
    @payee.destroy
    redirect_to(payees_url, :notice => "Payee deleted.")
  end
end
