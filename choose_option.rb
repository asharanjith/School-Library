require './app'
require './preserve_data'

class ChooseOption
  def choose_option(option, app)
    write_data('books', app.books)
    write_data('people', app.people)
    write_data('rentals', app.rentals)
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
end
