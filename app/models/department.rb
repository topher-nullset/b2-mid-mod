class Department < ApplicationRecord
  has_many :employees

  def self.levels_and_employees
    Department.joins(:employees).order('departments.floor ASC').distinct
  end
end