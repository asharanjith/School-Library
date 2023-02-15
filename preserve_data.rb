require 'fileutils'
require 'json'

FileUtils.mkdir_p('saved_data')
base_path = "#{Dir.pwd}/saved_data"

File.open("#{base_path}/books.json", 'w') unless File.exist?("#{base_path}/books.json")
File.open("#{base_path}/people.json", 'w') unless File.exist?("#{base_path}/people.json")
File.open("#{base_path}/rentals.json", 'w') unless File.exist?("#{base_path}/rentals.json")

def write_data(file, data)
  case file
  when 'books'
    write_data_book(data)
  when 'people'
    write_data_people(data)
  when 'rentals'
    write_data_rentals(data)
  end
end

def write_data_book(data)
  file_path = "#{Dir.pwd}/saved_data/books.json"
  hold_data_array = []
  data.each do |book|
    hold_data_array << { title: book.title, author: book.author }
  end
  File.write(file_path, hold_data_array.to_json, mode: 'w')
end

def write_data_people(data)
  file_path = "#{Dir.pwd}/saved_data/people.json"
  hold_data_array = []
  data.each do |person|
    hold_data_array << { id: person.id, name: person.name, age: person.age,
                         parent_permission: person.parent_permission, type: person.class.to_s }
  end
  File.write(file_path, hold_data_array.to_json, mode: 'w')
end

def write_data_rentals(data)
  file_path = "#{Dir.pwd}/saved_data/rentals.json"
  hold_data_array = []
  data.each do |rental|
    hold_data_array << { date: rental.date, book_title: rental.book.title, person_id: rental.person.id }
  end
  File.write(file_path, hold_data_array.to_json, mode: 'w')
end
