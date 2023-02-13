def choices
  options = [
    ' List all books',
    ' List all people',
    ' Create a person',
    ' Create a book',
    ' Create a rental',
    ' List all rentals for a given person id',
    ' Exit'
  ]
  options.each_with_index { |option, index| puts "#{index + 1}. #{option}" }
  print 'Please choose an option by entering a number: '
end
