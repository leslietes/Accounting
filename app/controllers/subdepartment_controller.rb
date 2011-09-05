class SubdepartmentController < ApplicationController
  
  before_filter :login_required
  
  def create
    @department = Department.find_by_id(params[:department_id])
    if @department
      @department.subdepartments.build(params[:subdepartment])
      if @department.save
        redirect_to departments_url
      else
        
      end
    else
      #redirect_to departments_url
    end
  end
end
