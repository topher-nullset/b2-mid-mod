class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
    @tickets = @employee.all_tickets
    @oldest_ticket = @employee.oldest_ticket
  end
end