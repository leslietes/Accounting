class AccountsController < ApplicationController
  
  before_filter :login_required
  
  def index
    @accounts = Account.all
  end
  
  def new
    @account = Account.new
  end
  
  def create
    @account = Account.new(params[:account])
    if @account.save
      redirect_to(accounts_url, :notice => "Account was successfully created.")
    else
      render :action => 'new', :status => :unprocessable_entity
    end
  end
  
  def edit
    @account = Account.find(params[:id])
  end
  
  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(params[:account])
      redirect_to(accounts_url, :notice => "Account was successfully updated.")
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to(accounts_url, :notice => "Account deleted.")
  end
  
end
