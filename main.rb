require './app'

def main
  app = App.new
  app.run
end

def display_menu
  loop do
    puts "\nPlease choose an option by entering a number:"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    option = gets.chomp.to_i
    handle_option(option)
    break if option == 7
  end
end

# rubocop:disable Metrics
def handle_option(option)
  case option
  when 1 then list_books
  when 2 then list_people
  when 3 then create_person
  when 4 then create_book
  when 5 then create_rental
  when 6 then list_rentals_by_person_id
  when 7 then exit_app
  else
    puts 'Invalid Selection'
  end
end
# rubocop:enable Metrics
main
