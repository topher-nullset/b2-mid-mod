class Employee < ApplicationRecord
  has_many :employee_tickets, dependent: :destroy
  has_many :tickets, through: :employee_tickets
  belongs_to :department
end