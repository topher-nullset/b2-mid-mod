class EmployeeTicketsController < ApplicationController
  def create
    employee = Employee.find(params[:id])
    ticket = Ticket.find(params[:ticket_id])
    employee.tickets << ticket

    redirect_to "/employees/#{employee.id}"
  end
end