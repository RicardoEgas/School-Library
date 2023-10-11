require_relative 'Person'

class Teacher < Person
  def initialize(specialization)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end