require './person'
require './book'
require './rental'
require './student'
require './teacher'
require './classroom'
require 'json'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    base_path = "#{Dir.pwd}/saved_data"

    @books = []
    books_json = File.read("#{base_path}/books.json")
    JSON.parse(books_json).each { |book| @books << Book.new(book['title'], book['author']) } unless books_json.empty?

    @people = []
    people_json = File.read("#{base_path}/people.json")
    handle_people(people_json == '' ? [] : JSON.parse(people_json))

    @rentals = []
    rentals_json = File.read("#{base_path}/rentals.json")
    handle_rentals(rentals_json == '' ? [] : JSON.parse(rentals_json))
  end

  def handle_people(people_json)
    people_json.each do |person|
      if person['type'] == 'Student'
        student = Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
        student.id = person['id']
        @people << student
      else
        teacher = Teacher.new(person['age'], person['specialization'], person['name'])
        teacher.id = person['id']
        @people << teacher
      end
    end
  end

  def handle_rentals(rentals_json)
    rentals_json.each do |rental|
      rented_book = @books.find { |book| book.title == rental['book_title'] }
      rented_person = @people.find { |person| person.id == rental['person_id'] }
      @rentals << Rental.new(rental['date'], rented_book, rented_person)
    end
  end

  def list_all_books
    if @books.empty?
      puts 'There are no books'
    else
      @books.each do |book|
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
  end

  def list_all_people
    if @people.empty?
      puts 'There are no people'
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp

    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    if person_type == '1'
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp
      parent_permission = parent_permission.downcase == 'y'

      person = Student.new(age, name, parent_permission: parent_permission)
    else
      print 'Specialization: '
      specialization = gets.chomp

      person = Teacher.new(age, specialization, name)
    end

    @people << person
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)

    @books << book
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number '
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_index], @people[person_index])

    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end
end
