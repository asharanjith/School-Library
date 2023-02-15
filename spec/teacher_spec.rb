require_relative '../teacher'

describe Teacher do
  context 'Check whether Person class can add new teacher and create teacher instance' do
    it 'When a new teacher is added, it should be an instance of Teacher class' do
      new_teacher = Teacher.new('Math',30,'Sara', parent_permission: true)
      expect(new_teacher).to be_instance_of(Teacher)
    end
    it 'Check if can use services' do
      permission = Teacher.new('Math',30,'Sara', parent_permission: true)
      expect(permission.can_use_services?).to be_truthy
    end
  end
end