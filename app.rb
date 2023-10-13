require_relative 'book'
require_relative 'rental'
require_relative 'persons'
require_relative 'students'
require_relative 'teachers'

class App
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def run
    display_menu
  end

  private

  def list_books
    if @books.empty?
      puts 'There are currently no recorded books in the system'
    else
      @books.each_with_index { |book, idx| display_book_info(book, idx) }
    end
  end

  def list_people
    if @people.empty?
      puts 'There are currently no recorded people in the system.'
    else
      @people.each_with_index { |person, idx| display_person_info(person, idx) }
    end
  end

  def display_book_info(book, idx)
    puts "#{idx} - Title: \"#{book.title}\", Author: #{book.author}"
  end

  def display_person_info(person, idx)
    puts "#{idx} - [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  def create_person
    print 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]:'
    option = gets.chomp.to_i

    case option
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_student
    print "\nName: "
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    if parent_permission.downcase == 'n'
      student = Student.new('classroom', age, true, name)
    elsif parent_permission.downcase == 'y'
      student = Student.new('classroom', age, false, name)
    else
      puts 'Invalid Selection for parent permission'
      return
    end
    @people << student
    puts 'Student created succesfully'
  end

  def create_teacher
    print "\nName: "
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, true, name)
    @people << teacher
    puts 'Teacher created succesfully'
  end

  def create_book
    print "\nTitle: "
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_rental
    list_books
    print 'Select a book from the following lists '
    book_index = gets.chomp.to_i

    list_people
    print 'Select a person from the following list by number (not id)'
    person_index = gets.chomp.to_i

    print 'Date: '
    date_of_rental = gets.chomp

    rental = Rental.new(@people[person_index], @books[book_index], date_of_rental)
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_rentals_by_person_id
    print "\nID of the person: "
    person_id = gets.chomp.to_i
    rentals = @rentals.select { |rental| rental.person.id == person_id }
    display_rentals(rentals)
  end

  def display_rentals(rentals)
    if rentals.empty?
      puts 'There are currently no rented books for the given person ID.'
    else
      puts 'Rentals:'
      rentals.each { |rental| puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}" }
    end
  end

  def exit_app
    puts 'Bye!'
  end
end
