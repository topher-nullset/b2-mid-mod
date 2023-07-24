require "rails_helper"

RSpec.describe "The Departments Index Page" do
  before(:each) do
    @department_1 = Department.create({name: "Shoes", floor: 2})
    @department_2 = Department.create({name: "Purses", floor: 2})
    @department_3 = Department.create({name: "Appliances", floor: 1})
    @employee_1 = Employee.create({name: "Jeff", level: 2, department_id: @department_1.id})
    @employee_2 = Employee.create({name: "Margaret", level: 2, department_id: @department_2.id})
    @employee_3 = Employee.create({name: "Carla", level: 2, department_id: @department_1.id})
    @employee_4 = Employee.create({name: "Juanita", level: 1, department_id: @department_3.id})
    @employee_5 = Employee.create({name: "Facundo", level: 1, department_id: @department_3.id})
    @employee_6 = Employee.create({name: "Meghan", level: 1, department_id: @department_3.id})
  end
    
  it "shows each department and its floor" do
    visit "/departments"
    # save_and_open_page
    expect(page).to have_content("Department: Appliances -- Floor: 1")
    expect(page).to have_content("Department: Shoes -- Floor: 2")
    expect(page).to have_content("Department: Purses -- Floor: 2")
  end

  it "shows the employees under each department" do
    visit "/departments"
    # save_and_open_page
    within("#Department-Appliances") do
      expect(page).to have_content("Staff: Juanita Facundo Meghan")
    end
    within("#Department-Shoes") do
      expect(page).to have_content("Staff: Jeff Carla")
    end
    within("#Department-Purses") do
      expect(page).to have_content("Staff: Margaret")
    end
  end
end