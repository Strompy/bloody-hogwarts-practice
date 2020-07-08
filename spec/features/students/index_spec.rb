require 'rails_helper'

RSpec.describe "students index page" do
  it "shows list of students with their information" do
    harry = Student.create!(name: "Harry", age: 12, house: "Gryffindor")

    visit "/students"

    expect(page).to have_content(harry.name)
    expect(page).to have_content(harry.age)
    expect(page).to have_content(harry.house)

  end
  it "shows average age of all students" do
    harry = Student.create!(name: "Harry", age: 12, house: "Gryffindor")
    george = Student.create!(name: "George", age: 13, house: "Gryffindor")

    visit "/students"

    expect(page).to have_content("Average Age: 12.5")
    
  end
end

# As a visitor,
# When I visit '/students',
# I see a list of students with the following information:
# -Name
# -Age
# -House
# (e.g. "Name: Casseopia Black, Age: 14, House: Slytherin")
