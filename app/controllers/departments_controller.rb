class DepartmentsController < ApplicationController
  def index
    @departments = Department.levels_and_employees
  end
end