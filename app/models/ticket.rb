class Ticket < ApplicationRecord
  has_many :employee_tickets, dependent: :destroy
  has_many :employees, through: :employee_tickets
end