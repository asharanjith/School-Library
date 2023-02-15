require_relative '../classroom'

describe Classroom do
  context 'Check whether Classroom class can add new student and create Classroom instance' do
    it 'When a new classroom is added, it should be an instance of Classroom class' do
      new_classroom = Classroom.new('Math')
      expect(new_classroom).to be_instance_of(Classroom)
    end
    it 'Check a student can be added to the classroom' do
      new_student = Student.new(12, 'John', parent_permission: true)
      new_classroom = Classroom.new('Math')
      new_classroom.add_students(new_student)
      expect(new_classroom.students).to include(new_student)
    end
  end
end
