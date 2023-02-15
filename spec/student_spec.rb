require_relative '../student'
require_relative '../classroom'

describe Student do
    context 'Check whether Student class can add new student and create Student instance' do
      it 'When a new student is added, it should be an instance of Student class' do
        new_student = Student.new(20,'Sam', parent_permission: true)
        expect(new_student).to be_instance_of(Student)
      end
      it 'Check a student can be added to the classroom' do
        new_student = Student.new(12, 'John', parent_permission: true)
        new_classroom = Classroom.new('Math')
        new_classroom.add_students(new_student)
        expect(new_student.classroom).to eq(new_classroom)
      end    
    end
  end