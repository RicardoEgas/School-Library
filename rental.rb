class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(date, person, book)
    @person = person
    @book = book
    @date = date

    person.rental << self
    book.rental << self
  end
end
