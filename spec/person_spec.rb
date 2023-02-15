require_relative '../person'

describe Person do
  context 'Check whether Person class can add new person and create person instance' do
    it 'When a new person is added, it should be an instance of Person class' do
      new_person = Person.new(20,'Sam', parent_permission: true,)
      expect(new_person).to be_instance_of(Person)
    end
    it 'Check a parent permission' do
      permission = Person.new(12, 'John', parent_permission: true)
      expect(permission.can_use_services?).to be_truthy
    end
    it 'Check the name' do
      name = Person.new(12, 'John', parent_permission: true)
      expect(name.correct_name).to eq("John")
    end
  end
end