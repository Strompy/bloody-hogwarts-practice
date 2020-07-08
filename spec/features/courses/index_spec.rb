require 'rails_helper'

RSpec.describe "courses index" do
  it "shows a list of courses and the number of students enrolled in each course" do
    harry = Student.create!(name: "Harry", age: 12, house: "Gryffindor")
    ron = Student.create!(name: "Ron", age: 12, house: "Gryffindor")
    malfoy = Student.create!(name: "Malfoy", age: 12, house: "Slytherin")
    course1 = Course.create!(name: "Defense against the Dark Arts")
    course2 = Course.create!(name: "Herbology")
    course3 = Course.create!(name: "Potions")
    StudentCourse.create!(student: harry, course: course1)
    StudentCourse.create!(student: harry, course: course2)
    StudentCourse.create!(student: harry, course: course3)
    StudentCourse.create!(student: ron, course: course3)
    StudentCourse.create!(student: malfoy, course: course2)
    StudentCourse.create!(student: malfoy, course: course3)

    visit "/courses"

    expect(page).to have_content("Defense against the Dark Arts: 1")
    expect(page).to have_content("Herbology: 2")
    expect(page).to have_content("Potions: 3")
  end
end
