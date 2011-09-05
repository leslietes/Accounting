class DepartmentsController < ApplicationController
  
  before_filter :login_required
  
  def index
    @departments = Department.all
  end
  
  def show
    @department = Department.find_by_id(params[:id])
    if @department
      @subdepartment  = Subdepartment.new
      @subdepartments = @department.subdepartments
    else
      redirect_to departments_url
    end
  end
  
  def new
    @department = Department.new
  end
  
  def create
    @department = Department.new(params[:department])
    if @department.save
      redirect_to departments_url, :notice => "Department added successfully."
    else
      render :action => 'new', :status => :unprocessable_entity
    end
  end
  
  def edit
    @department = Department.find_by_id(params[:id])
  end
  
  def update
    @department = Department.find_by_id(params[:id])
    if @department.update_attributes(params[:department])
      redirect_to departments_url, :notice => "Department successfully updated." 
    else
      render :action => 'edit'      
    end
  end
  
  def delete
    @department = Department.find_by_id(params[:id])
    @department.destroy
    redirect_to departments_url, :notice => "Department deleted."
  end
end
