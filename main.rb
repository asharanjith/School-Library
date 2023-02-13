require './app'
require './choices'
require './choose_option'

def main
  app = App.new
  puts 'Welcome to School Library App!'
  puts ''
  option = 0
  loop do
    choices
    option = gets.chomp.to_i
    puts ''
    choose_option = ChooseOption.new
    choose_option.choose_option(option, app)
    break if option == 7
  end
  puts 'Thank you for using this app!'
end

main
