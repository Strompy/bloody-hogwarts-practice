require 'rails_helper'

RSpec.describe "Student show page" do
  it "displays a list of students courses" do
    harry = Student.create!(name: "Harry", age: 12, house: "Gryffindor")
    course1 = Course.create!(name: "Defense against the Dark Arts")
    course2 = Course.create!(name: "Herbology")
    course3 = Course.create!(name: "Potions")
    StudentCourse.create!(student: harry, course: course1)
    StudentCourse.create!(student: harry, course: course2)
    StudentCourse.create!(student: harry, course: course3)

    visit "/students/#{harry.id}"

    expect(page).to have_content("Defense against the Dark Arts")
    expect(page).to have_content("Herbology")
    expect(page).to have_content("Potions")
  end
end
