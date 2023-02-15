require_relative '../rental'
require_relative '../student'
require_relative '../book'

describe Rental do
  context 'Check whether Rental class can add new person and create person instance' do
    it 'When a new rental is added, it should be an instance of Rental class' do
      new_student = Student.new(20,'Sam', parent_permission: true)
      new_book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
      new_rental = Rental.new('2023/02/15', new_book,new_student )
      expect(new_rental).to be_instance_of(Rental)
    end
  end
end
