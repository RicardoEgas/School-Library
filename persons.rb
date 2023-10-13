require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
require './rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age = nil, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
    @rentals = []
  end

  def add_rental(book, date)
    rental = Rental.new(book, date, self)
    @rentals << rental
  end

  def can_use_services?
    of_age? || @parent_permission == true
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age && @age >= 18
  end
end
