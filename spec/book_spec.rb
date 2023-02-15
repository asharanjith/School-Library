require_relative '../book'
require_relative '../rental'
require_relative '../person'
require_relative '../student'

describe Book do
  context 'Check whether Book class can add new book and create Book instance' do
    it 'When a new book is added, it should be an instance of Book class' do
      new_book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
      expect(new_book).to be_instance_of(Book)
    end
    it 'Check a rental is added to the book' do
      new_student = Student.new(12, 'John', parent_permission: true)
      new_book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
      new_rental = Rental.new('2022/02/13', new_book, new_student)
      new_book.add_rental(new_rental)
      expect(new_book.rentals[0].book).to eq(new_book)
    end
  end
end
