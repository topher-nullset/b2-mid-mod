require "rails_helper"

RSpec.describe "Employees Show Page" do
  before(:each) do
    @department_1 = Department.create!({name: "Shoes", floor: 2})
    @department_2 = Department.create!({name: "Purses", floor: 2})
    @employee_1 = Employee.create!({name: "Jeff", level: 2, department_id: @department_1.id})
    @employee_2 = Employee.create!({name: "Margaret", level: 2, department_id: @department_2.id})
    @ticket_1 = Ticket.create!({subject: "Door is locked", age: 1})
    @ticket_2 = Ticket.create!({subject: "Printer is jammed", age: 2})
    @ticket_3 = Ticket.create!({subject: "Where is Waldo?", age: 3})
    @ticket_1.employees << [@employee_1, @employee_2]
    @ticket_2.employees << [@employee_1, @employee_2]
    @ticket_3.employees << [ @employee_2]
  end

  it "shows the employee's information" do
    visit "/employees/#{@employee_1.id}"
    # save_and_open_page
    expect(page).to have_content(@employee_1.name)
    expect(page).to have_content("Department: Shoes")
    within("#tickets") do
      list_items = all("li")
      expect(list_items.length).to eq(2)
      expect(list_items[0]).to have_content("Printer is jammed")
      expect(list_items[1]).to have_content("Door is locked")
    end
  end

  it "shows the employees oldest ticket" do
    visit "/employees/#{@employee_1.id}"
    # save_and_open_page
    expect(page).to have_content("Oldest Ticket")
  end

  it "doesn't show unassociated tickets" do
    visit "/employees/#{@employee_1.id}"
    # save_and_open_page
    expect(page).not_to have_content("Where is Waldo?")
  end

  it "has a form to add tickets to an employee" do
    visit "/employees/#{@employee_1.id}"
    # save_and_open_page
    fill_in "Ticket", with: @ticket_3.id
    click_button "Submit"
    save_and_open_page
    expect(page).to have_content("Where is Waldo? - 3")
  end
end