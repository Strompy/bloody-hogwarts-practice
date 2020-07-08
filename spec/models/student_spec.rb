require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'methods' do
    it "#average_age" do
      harry = Student.create!(name: "Harry", age: 12, house: "Gryffindor")
      george = Student.create!(name: "George", age: 13, house: "Gryffindor")

      expect(Student.all.average_age).to eq(12.5)
    end
  end
end
