require './app'

def display_options
  puts 'Please choose an option by entering a number:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a  rental'
  puts '6. List all rentals for a given person id'
  puts '7. Exit'
end

def choose_option(option, app)
  case option
  when 1
    app.list_all_books
  when 2
    app.list_all_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_rentals
  end
end

def main
  app = App.new
  puts 'Welcome to School Library App!'
  puts ''
  option = 0
  while option != 7
    display_options
    option = gets.chomp.to_i
    choose_option(option, app)
  end
  puts 'Thank you for using this app!'
end

main
