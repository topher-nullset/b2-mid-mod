class Employee < ApplicationRecord
  has_many :employee_tickets, dependent: :destroy
  has_many :tickets, through: :employee_tickets
  belongs_to :department

  def all_tickets
    tickets.order(age: :desc)
  end
  
  def oldest_ticket
    tickets.order(age: :desc).first
  end
end